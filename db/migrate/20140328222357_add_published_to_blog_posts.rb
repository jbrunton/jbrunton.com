class AddPublishedToBlogPosts < ActiveRecord::Migration
  def change
    add_column :blog_posts, :published, :boolean, :null => false, :default => true
    change_column_default(:blog_posts, :published, nil)
  end
end
