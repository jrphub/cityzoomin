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

require 'test_helper'

class PhotoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
