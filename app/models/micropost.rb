# == Schema Information
#
# Table name: microposts
#
#  id          :integer(4)      not null, primary key
#  content     :text
#  location_id :integer(4)      not null
#  title       :string(255)     not null
#  category    :string(255)     not null
#  user_id     :integer(4)      not null
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

class Micropost < ActiveRecord::Base
  attr_accessible :category, :content, :title, :location_id
  belongs_to :user
  has_one :location
  is_impressionable
  
  validates :user_id, presence: true
  validates :category, presence:true
  validates :location_id, presence:true
  validates :title, presence:true, length:{maximum: 80}
  
  default_scope order: 'microposts.created_at DESC'
end
