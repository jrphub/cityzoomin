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

require 'test_helper'

class TempLocationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
