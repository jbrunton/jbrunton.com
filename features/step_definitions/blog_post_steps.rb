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

Then(/^there should be a blog post "(.*?)"(?: with content "(.*?)")?$/) do |title, content|
  expect(page).to have_selector('.blog-post .title', text: title)
  unless content.nil?
    expect(page).to have_selector('.blog-post .content', text: content)
  end
  @subject = page.all('.blog-post', text: title).first
end

Given(/^a blog post "(.*?)" created yesterday$/) do |title|
  create(:blog_post, title: title, created_at: DateTime.now.change(day: -1))
end

Given(/^a blog post "(.*?)" created today$/) do |title|
  create(:blog_post, title: title, created_at: DateTime.now)
end

Given(/^a blog post "(.*?)" created on (\d+)\-(\d+)\-(\d+)$/) do |title, year, month, day|
  create(:blog_post, title: title, created_at: DateTime.new(year, month, day))
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

Then(/^its title should be "(.*?)" and should link to the blog post "(.*?)"$/) do |expected_title, actual_title|
  blog_post = BlogPost.where(title: actual_title).first
  expect(@subject.find('.title')).to have_link(expected_title, href: blog_post_path(blog_post))
end

Then(/^its date should be "(.*?)"$/) do |date|
  expect(@subject.find('.date')).to have_text(date)
end
