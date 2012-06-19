class Photo < ActiveRecord::Base
  attr_accessible :url, :user_id, :micropost_id, :is_profile
  belongs_to :user
  belongs_to :micropost
end
