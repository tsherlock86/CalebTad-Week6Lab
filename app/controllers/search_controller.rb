class SearchController < ApplicationController

  def index
    @squawks = Squawk.all.order("created_at DESC")
  end
  
end
