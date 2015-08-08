class ProfilesController < ApplicationController
  before_action :set_user

  def index
    @squawks = @user.squawks.order("created_at DESC")
  end

  def follow
    if current_user
      if current_user == @user
        flash[:error] = "You cannot follow yourself."
        redirect_to :back
      else
        current_user.follow(@user)
        flash[:notice] = "You are now following #{@user.username}."
        redirect_to :back
      end
    else
      flash[:error] = "You must Sign In to follow #{@user.username}."
      redirect_to :back
    end
  end

  def unfollow
    if current_user
      current_user.stop_following(@user)
      flash[:notice] = "You are no longer following #{@user.username}."
      redirect_to :back
    else
      flash[:error] = "You must sign in to unfollow #{@user.username}."
    end
  end

  def block
    if current_user
      if current_user == @user
        flash[:error] = "You cannot block yourself."
        redirect_to :back
      else
        current_user.block(@user)
        flash[:notice] = "You have now blocked #{@user.username}."
        # Stop following a user that you block
        if @user.followed_by?(current_user)
          current_user.stop_following(@user)
        end
        redirect_to :back
      end
    else
      flash[:error] = "You must Sign In to block #{@user.username}."
      redirect_to :back
    end
  end

  def unblock
    if current_user
      current_user.unblock(@user)
      flash[:notice] = "You have unblocked #{@user.username}."
      redirect_to :back
    else
      flash[:error] = "You must sign in to unblock #{@user.username}."
    end
  end

  private

  def set_user
    @user = User.find_by "username = ?", params[:username]
  end

end
