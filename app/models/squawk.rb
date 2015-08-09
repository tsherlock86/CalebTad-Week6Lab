class Squawk < ActiveRecord::Base
  belongs_to :user
  validates_length_of :body, maximum: 170
  before_save :replace_with_link

  def self.timeline(user)
    following_ids = user.all_following.collect(&:id)
    all_ids = following_ids << user.id
    Squawk.where(user_id: all_ids).order("created_at DESC")
  end

  def replace_with_link
    if /~([A-Za-z0-9]+)/.match(self.body)
      self.body.gsub!(/~([A-Za-z0-9]+)/, create_search_link(get_match))
    end
  end

  def create_search_link(string)
    %Q{<a href="/search/#{string}">#{string}</a>}
  end

  def get_match
    /~([A-Za-z0-9]+)/.match(self.body)
  end

end
