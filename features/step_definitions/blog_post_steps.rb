Given(/^a blog post "(.*?)" with content "(.*?)"$/) do |title, content|
  create(:blog_post, title: title, content: content)
end

When(/^I am on the page for the blog post "(.*?)"$/) do |title|
  blog_post = BlogPost.where(title: title).first
  visit url_for(blog_post)
end

Then(/^I should see the post "(.*?)" with content "(.*?)"$/) do |title, content|
  expect(page).to have_selector('.blog-post .title', text: title)
  expect(page).to have_selector('.blog-post .content', text: content)
end
