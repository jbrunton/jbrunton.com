Given(/^I navigate to "(.*?)"$/) do |url|
  visit url
end

Given(/^I (?:am on|go to) the (home|admin) page$/) do  |page|
  visit (page == 'home') ? '/' : page
end

When(/^I click "(.*?)"$/) do |link|
  click_link link
end

Then(/^I go to the "(.*?)" page for the blog post "(.*?)"$/) do |action, title|
  blog_post = BlogPost.where(title: title).first
  visit url_for(controller: 'blog_posts', action: action, id: blog_post.id)
end


Then(/^I should be on the "(.*?)" page for the blog post "(.*?)"$/) do |action, title|
  blog_post = BlogPost.where(title: title).first
  expected_url = url_for(controller: 'blog_posts', action: action, id: blog_post.id)
  expect(current_url).to eq(expected_url)
end
