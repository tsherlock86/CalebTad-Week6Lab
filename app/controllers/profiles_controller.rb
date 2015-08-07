class ProfilesController < ApplicationController

  def index
    @user = User.find_by "username = ?", params[:username]
    @squawks = @user.squawks
  end

  def follow
    @user = User.find_by "username = ?", params[:username]

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
    @user = User.find_by "username = ?", params[:username]

    if current_user
      current_user.stop_following(@user)
      flash[:notice] = "You are no longer following #{@user.full_name}."
      redirect_to root_path
    else
      flash[:error] = "You must <a href='/users/sign_in'>login</a> to unfollow #{@user.monniker}.".html_safe
    end
  end

end
