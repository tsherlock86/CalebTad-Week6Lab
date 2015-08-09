class SearchController < ApplicationController

  def index
    @squawks = find_matches
  end

  def find_matches
    if params[:search_item] == ""
      squawks = []
    else
      squawks = Squawk.all.order("created_at DESC").select do |squawk|
        squawk.body.downcase.include?(params[:search_item].downcase)
      end
    end
    squawks
  end

end
