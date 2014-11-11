module BlogPostsHelper
  def prettydate(datetime)
    datetime.strftime('%-d %b, %Y').upcase
  end
end
