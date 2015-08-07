class ProfilesController < ApplicationController




  def index
    @squawks = Squawk.all
    @user = current_user
  end










end
