module ApplicationHelper
  def friendly_page_path(page)
    "/#{page.friendly_id}"
  end
  
  def markdown(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)
    markdown.render(text).html_safe
  end
end
