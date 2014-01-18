module BlogPostsHelper
  def markdown(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)
    markdown.render(text).html_safe
  end
  
  def prettydate(datetime)
    datetime.strftime('%-d %b, %Y')
  end
end
