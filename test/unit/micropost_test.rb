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

require 'test_helper'

class MicropostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
