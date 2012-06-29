# == Schema Information
#
# Table name: users
#
#  id              :integer(4)      not null, primary key
#  username        :string(255)     not null
#  email           :string(255)     not null
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#  password_digest :string(255)
#  remember_token  :string(256)
#  temp_password   :string(255)
#  signin_at       :datetime
#  has_pic         :boolean(1)      default(FALSE), not null
#  admin           :boolean(1)      default(FALSE)
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
