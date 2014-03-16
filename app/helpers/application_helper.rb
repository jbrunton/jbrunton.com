module ApplicationHelper
  def friendly_page_path(page)
    "/#{page.friendly_id}"
  end
end
