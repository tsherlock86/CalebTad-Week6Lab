class AfterSignupController < ApplicationController
  include Wicked::Wizard
  steps :username, :avatar

  #defining the show field for first step
  def show
    @user = current_user
    render_wizard
  end

  # defining view for updates
  def update
    @user = current_user
    @user.update(user_params)
    render_wizard @user
  end

  def after_signup_params
    params.require(:user).permit(:first_name, :last_name, :username, :avatar)
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :avatar)
  end

  private

  def redirect_to_finish_wizard(options = nil)
    redirect_to root_path , notice: "Thank you for signing up."
  end

end
