# == Schema Information
#
# Table name: comments
#
#  id           :integer(4)      not null, primary key
#  description  :text            default(""), not null
#  user_id      :integer(4)      not null
#  micropost_id :integer(4)      not null
#  username     :string(255)     not null
#  email        :string(255)     not null
#  haspic       :boolean(1)
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#

class Comment < ActiveRecord::Base
  # attr_accessible :title, :body
 attr_accessible :description, :user_id,:micropost_id, :username, :email, :has_pic
 belongs_to :user
 belongs_to :micropost
 
 validates :description, :presence=>true
end
