class Page < ActiveRecord::Base
  include FriendlyId
  
  friendly_id :title, :use => [:slugged, :finders]
end
