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
#

class User < ActiveRecord::Base
  attr_accessible :username, :email,:temp_password, :password, :password_confirmation
  has_secure_password
  has_many :microposts
  
  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token
  
  validates :username, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  
  def update_just_this_one(attr, value)
      raise "Bad #{attr}" if(!User.valid_attribute?(attr, value))
      self.update_attribute(attr, value)
    end

  def self.valid_attribute?(attr, value)
    mock = self.new(attr => value)
    unless mock.valid?
      return mock.errors.has_key?(attr)
    end
    true
  end
  
  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
