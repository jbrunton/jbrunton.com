module BlogPostsHelper
  def prettydate(datetime)
    datetime.strftime('%-d %b, %Y')
  end
  
  def preview(document)
    paragraphs = Nokogiri::HTML(document).css("p")
    preview_set = paragraphs.inject([]) do |current_set, p|
      potential_set = current_set + [p]

      if current_set.empty?
        # always at least one paragraph
        potential_set
      elsif text_length(potential_set) < 400
        # or add the next paragraph if we're still under the preview character limit
        potential_set
      else
        # otherwise, we're done
        current_set
      end
    end
    preview_set.map { |p| p.to_html }.join.html_safe
  end
  
private
  def text_length(paragraph_set)
    paragraph_set.map { |p| p.text.length }.inject(:+)
  end
end
