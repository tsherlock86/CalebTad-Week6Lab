class ProfilesController < ApplicationController
  before_action :set_user

  def index
    @squawks = @user.squawks.order("created_at DESC")
  end

  def follow
    if @user.cannot_follow?(@user)
      respond_to do |format|
        format.html {redirect_to :back, :notice => "You cannot follow this person."}
        format.js {}
      end
    else
      current_user.follow(@user)
      respond_to do |format|
        format.html {redirect_to :back, :notice => "You are now following #{@user.username}"}
        format.js {}
      end
    end
  end

  def unfollow
    current_user.stop_following(@user)
    respond_to do |format|
      format.html {redirect_to :back, :notice => "You are no longer following #{@user.username}"}
      format.js {:follow}
    end
  end

  def block
    if current_user == @user
      flash[:error] = "You cannot block yourself."
      redirect_to :back
    else
      current_user.block(@user)
      flash[:notice] = "You have now blocked #{@user.username}."
      current_user.stop_following(@user)
      redirect_to :back
    end
  end

  def unblock
    current_user.unblock(@user)
    flash[:notice] = "You have unblocked #{@user.username}."
    redirect_to :back
  end

  private

  def set_user
    @user = User.find_by "username = ?", params[:username]
  end

end
