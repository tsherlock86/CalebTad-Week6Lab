class StaticPagesController < ApplicationController

  def home
    @squawk = Squawk.new
  end

end
