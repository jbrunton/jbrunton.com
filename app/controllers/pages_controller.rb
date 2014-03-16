class PagesController < ApplicationController
  load_and_authorize_resource :except => [:render_if_exists]
  inherit_resources

  def render_if_exists
    id = params[:id]
    begin
      @page = Page.find(id)
      authorize! :read, @page
      render 'show'
    rescue ActiveRecord::RecordNotFound
      raise ActionController::RoutingError.new('Not Found')
    end
  end
  
  def update
    update! do |success, failure|
      failure.html { render action: 'edit' }
      failure.json { render json: @page.errors, status: :unprocessable_entity }
    end
  end
  
private
  # TODO: is this implementation equivalent to this?
  #   params.require(:page).permit(:title, :content)
  # See for more details:
  #   https://github.com/josevalim/inherited_resources
  def build_resource_params
    [params.fetch(:page, {}).permit(:title, :content)]
  end
end
