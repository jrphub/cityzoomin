# == Schema Information
#
# Table name: temp_locations
#
#  id         :integer(4)      not null, primary key
#  address    :string(255)
#  latitude   :float
#  longitude  :float
#  city       :string(255)
#  state      :string(255)
#  country    :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class TempLocation < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :address, :latitude, :longitude
  acts_as_gmappable
      def gmaps4rails_address
          address
      end
       def gmaps4rails_infowindow
         "<h4>Location</h4>" << "<h4>#{address}</h4>"
     end
end
