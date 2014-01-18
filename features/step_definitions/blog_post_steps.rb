Given(/^a blog post "(.*?)"(?: with content "(.*?)")?$/) do |title, content|
  if content then
    create(:blog_post, title: title, content: content)
  else
    create(:blog_post, title: title)
  end    
end

When(/^I am on the page for the blog post "(.*?)"$/) do |title|
  blog_post = BlogPost.where(title: title).first
  visit url_for(blog_post)
end

Then(/^I should see the post "(.*?)"(?: with content "(.*?)")?$/) do |title, content|
  expect(page).to have_selector('.blog-post .title', text: title)
  unless content.nil?
    expect(page).to have_selector('.blog-post .content', text: content)
  end
end

Given(/^a blog post "(.*?)" created yesterday$/) do |title|
  create(:blog_post, title: title, created_at: DateTime.now.change(day: -1))
end

Given(/^a blog post "(.*?)" created today$/) do |title|
  create(:blog_post, title: title, created_at: DateTime.now)
end

When(/^I am on the page for blog posts$/) do
  visit blog_posts_path
end

Then(/^the first blog post should be "(.*?)"$/) do |title|
  expect(page.all('.blog-post .title').first).to have_text(title)
end

Then(/^there should be the html "(.*?)"$/) do |html|
  expect(page.html).to include(html)
end
