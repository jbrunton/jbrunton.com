class BlogPost < ActiveRecord::Base
  include FriendlyId
  
  friendly_id :title, :use => [:slugged, :finders]

  validates :title, presence: true
  
  def normalize_friendly_id(string)
    "#{id}-#{string.parameterize}"
  end
  
  def self.find_by_slug_safely!(slug)
    blog_post = BlogPost.find_by_slug(slug)
    blog_post ||= begin
      match = /^\d+/.match(slug)
      BlogPost.find(match[0].to_i) unless match.nil?
    end
  end
  
  after_create do |user|
    # the id isn't present the first time we save the record so the slug format
    # (see normalize_friendly_id) won't be right, so we refresh the slug
    user.slug = nil
    user.save!
  end
  
  after_update do |user|
    # update the friendly_id if the title of the post changes
    unless user.friendly_id == normalize_friendly_id(user.title)
      user.slug = nil
      user.save!
    end
  end
end
