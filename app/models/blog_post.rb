class BlogPost < ActiveRecord::Base
  include FriendlyId
  
  friendly_id :title, :use => [:slugged, :finders]

  validates :title, presence: true
  
  def normalize_friendly_id(string)
    "#{id}-#{string.parameterize}"
  end
  
  after_create do |user|
    # the id isn't present the first time we save the record so the slug format
    # (see normalize_friendly_id) won't be right, so we refresh the slug
    user.slug = nil
    user.save!
  end
end
