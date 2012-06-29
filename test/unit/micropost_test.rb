# == Schema Information
#
# Table name: microposts
#
#  id          :integer(4)      not null, primary key
#  content     :text
#  has_photo   :boolean(1)      default(FALSE), not null
#  location_id :integer(4)      not null
#  title       :string(255)     not null
#  user_id     :integer(4)      not null
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

require 'test_helper'

class MicropostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
