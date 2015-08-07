class ProfilesController < ApplicationController




  def index
    @squawks = Squawk.all
    @user = User.find_by "username = ?", params[:username]
  end










end
