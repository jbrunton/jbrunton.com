class RenameContentToBodyOnBlogPosts < ActiveRecord::Migration
  def change
    rename_column :blog_posts, :content, :body
  end
end
