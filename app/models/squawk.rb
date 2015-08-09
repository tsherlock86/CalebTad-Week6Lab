class Squawk < ActiveRecord::Base
  belongs_to :user
  validates_length_of :body, maximum: 170

  def self.timeline(user)
    following_ids = user.all_following.collect(&:id)
    all_ids = following_ids << user.id
    Squawk.where(user_id: all_ids).order("created_at DESC")
  end

end
