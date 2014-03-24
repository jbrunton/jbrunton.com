Given(/^a blog post "(.*?)"(?: with jump text "(.*?)")?(?: (?:and|with) body text "(.*?)")?$/) do |title, jump_text, body_text|
  opts = {title: title}
  opts.merge!(body: body_text) unless body_text.nil?
  opts.merge!(jump: jump_text) unless jump_text.nil?
  create(:blog_post, opts)
end

When(/^I am on the page for the blog post "(.*?)"$/) do |title|
  blog_post = BlogPost.where(title: title).first
  visit url_for(blog_post)
end

Then(/^there should be a blog post "(.*?)"(?: with jump text "(.*?)")?(?: (?:and|with) body text "(.*?)")?$/) do |title, jump_text, body_text|
  expect(page).to have_selector('.blog-post .title', text: title)
  unless jump_text.nil?
    expect(page).to have_selector('.blog-post .jump', text: jump_text)
  end
  unless body_text.nil?
    expect(page).to have_selector('.blog-post .body', text: body_text)
  end
  @subject = page.all('.blog-post', text: title).first
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

Then(/^it should have a link "(.*?)" which links to the blog post "(.*?)"$/) do |link_text, blog_post_title|
  blog_post = BlogPost.where(title: blog_post_title).first
  expect(@subject).to have_link(link_text, href: blog_post_path(blog_post))
end

When(/^I compose a blog post with title "(.*?)"$/) do |title|
  visit "/blog/new"
  within("form#new_blog_post") do
    fill_in 'blog_post[title]', :with => title
  end
  click_button 'Create'
end