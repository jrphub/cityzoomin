# == Schema Information
#
# Table name: photos
#
#  id           :integer(4)      not null, primary key
#  url          :string(255)
#  user_id      :integer(4)      not null
#  micropost_id :integer(4)
#  profile_pic  :integer(4)      default(0), not null
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#

class Photo < ActiveRecord::Base
  attr_accessible :url, :user_id, :micropost_id, :profile_pic
  belongs_to :user
  belongs_to :micropost
end
