class AfterSignupController < ApplicationController
  include Wicked::Wizard
  steps :registration, :username, :avatar


  #defining the show field for first step
  #user can only skip on avatar/bio page
  def show
  @user = current_user
  case step
  when :avatar
    skip_step if @user.avatar.blank?
  end
  render_wizard
 end

 #defining view for updates
 def update
   @user = current_user
   @user.attributes = params[:user]
   render_wizard @user
 end















 private

  def redirect_to_finish_wizard
    redirect_to root_url, notice: "Thank you for signing up."
  end

end
