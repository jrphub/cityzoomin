class Comment < ActiveRecord::Base
  # attr_accessible :title, :body
 attr_accessible :description, :user_id,:micropost_id, :username, :email
 belongs_to :user
 belongs_to :micropost
 
 validates :description, :presence=>true
end
