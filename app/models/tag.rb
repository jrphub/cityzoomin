#TODO https://www.ruby-toolbox.com/projects/acts-as-taggable-on
#TODO http://mattmcnierney.wordpress.com/2011/07/30/tag-clouds-in-ruby-on-rails/
#TODO http://www.idolhands.com/ruby-on-rails/guides-tips-and-tutorials/creating-a-heatmap-or-tag-cloud-in-rails
#TODO https://github.com/DukeLeNoir/jQCloud
class Tag < ActiveRecord::Base
  attr_accessible :label, :count
  has_and_belongs_to_many :microposts
  before_save { |tag| tag.label = label.downcase }
  validates :label, uniqueness: { case_sensitive: false },
            presence:   true

  def self.save_and_update_tags(labels)
    tags = []
    labels.each do |label|
      tag = Tag.find_by_label(label)
      if tag.nil?
        tag = Tag.create!(:label => label, :count => 1)
        tags << tag
      else
        tag.count = tag.count + 1
        tag.save!
        tags << tag
      end
      logger.debug "==========================#{tag}================================"
    end
    return tags
  end
end
