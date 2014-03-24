class AddJumpToBlogPosts < ActiveRecord::Migration
  def change
    add_column :blog_posts, :jump, :text
  end
end
