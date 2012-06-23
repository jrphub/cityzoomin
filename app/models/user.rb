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
#  admin           :boolean(1)      default(FALSE)
#

class User < ActiveRecord::Base
  attr_accessible :username, :email,:temp_password, :password, :password_confirmation, :signin_at, :admin, :has_pic
  has_secure_password
  has_many :microposts, dependent: :destroy
  has_many :photos, dependent: :destroy
  acts_as_voter
  has_many :comments#polymorphic association is not applicable for comment, user, micropost
  #is_impressionable
  
  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token
  
  validates :username, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  
  
  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
