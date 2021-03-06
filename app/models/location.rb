# == Schema Information
#
# Table name: locations
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)     not null
#  city       :string(255)
#  state      :string(255)
#  country    :string(255)
#  latitude   :float
#  longitude  :float
#  gmaps      :boolean(1)      default(TRUE), not null
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Location < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :name, :city, :state, :country, :latitude, :longitude, :gmaps
  #is_impressionable
  acts_as_gmappable
      def gmaps4rails_address
          name
      end
       def gmaps4rails_infowindow
         "<div class='map-header'>Location</div>" << "<div class='map-details'>#{name}</div>"
     end
   
  
  validates :name, presence:true
  
  
  
end
