class BlogPostsController < ApplicationController
  # Exclude :index because load_and_authorize doesn't work with inherited_resources.
  # See https://github.com/ryanb/cancan/wiki/Inherited-Resources
  load_and_authorize_resource :except => :index
  inherit_resources

  def show    
    unless params[:id] == @blog_post.slug
      redirect_to @blog_post
      return
    end
    show!
  end

protected
  # TODO: is this implementation equivalent to this?
  #   params.require(:blog_post).permit(:title, :jump, :body)
  # See for more details:
  #   https://github.com/josevalim/inherited_resources
  def build_resource_params
    [params.fetch(:blog_post, {}).permit(:title, :jump, :body, :published)]
  end

  def resource 
    @blog_post ||= BlogPost.find_by_slug_safely!(params[:id]) 
  end
  
  def collection
    @blog_posts ||= BlogPost.all.sort_by(&:created_at)
  end
end
