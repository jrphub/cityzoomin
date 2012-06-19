# == Schema Information
#
# Table name: votes
#
#  id            :integer(4)      not null, primary key
#  vote          :boolean(1)      default(FALSE)
#  voteable_id   :integer(4)      not null
#  voteable_type :string(255)     not null
#  voter_id      :integer(4)
#  voter_type    :string(255)
#  created_at    :datetime        not null
#  updated_at    :datetime        not null
#

class Vote < ActiveRecord::Base

  scope :for_voter, lambda { |*args| where(["voter_id = ? AND voter_type = ?", args.first.id, args.first.class.base_class.name]) }
  scope :for_voteable, lambda { |*args| where(["voteable_id = ? AND voteable_type = ?", args.first.id, args.first.class.base_class.name]) }
  scope :recent, lambda { |*args| where(["created_at > ?", (args.first || 2.weeks.ago)]) }
  scope :descending, order("created_at DESC")

  belongs_to :voteable, :polymorphic => true
  belongs_to :voter, :polymorphic => true

  attr_accessible :vote, :voter, :voteable


  # Comment out the line below to allow multiple votes per user.
  validates_uniqueness_of :voteable_id, :scope => [:voteable_type, :voter_type, :voter_id]

end
