# == Schema Information
#
# Table name: locations
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)     not null
#  city       :string(255)     not null
#  state      :string(255)     not null
#  country    :string(255)     not null
#  latitude   :decimal(6, 6)
#  longitude  :decimal(6, 6)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Location < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :name, :city, :state, :country
  
  validates :name, presence:true
  validates :city, presence:true
  validates :state, presence:true
  validates :country, presence:true
end
