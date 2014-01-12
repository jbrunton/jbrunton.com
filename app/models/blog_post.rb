class BlogPost < ActiveRecord::Base
  validates :title, presence: true
end
