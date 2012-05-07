# == Schema Information
#
# Table name: microposts
#
#  id         :integer(4)      not null, primary key
#  content    :string(255)
#  city       :string(255)
#  location   :string(255)
#  title      :string(255)
#  category   :string(255)
#  user_id    :integer(4)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Micropost < ActiveRecord::Base
  attr_accessible :category, :city, :content, :location, :title
  belongs_to :user
  
  validates :user_id, presence: true
  validates :category, presence:true
  validates :city, presence:true
  validates :location, presence:true
  validates :title, presence:true, length:{maximum: 80}
  
  default_scope order: 'microposts.created_at DESC'
end
