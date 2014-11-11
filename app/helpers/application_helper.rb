module ApplicationHelper
  def friendly_page_path(page)
    "/#{page.friendly_id}"
  end
  
  def markdown(text)
    return "" if text.nil?
    renderer = Redcarpet::Render::HTML.new(:hard_wrap => true)
    markdown = Redcarpet::Markdown.new(renderer,
      :autolink => true,
      :space_after_headers => true,
      :hard_wrap => true)
    markdown.render(text).html_safe
  end
end
