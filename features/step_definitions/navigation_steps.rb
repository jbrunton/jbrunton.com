Given(/^I navigate to "(.*?)"$/) do |url|
  visit url
end

Given(/^I (?:am on|go to) the (home|admin) page$/) do  |page|
  visit (page == 'home') ? '/' : page
end

When(/^I click "(.*?)"$/) do |link_or_button|
  click_on link_or_button
end

Then(/^I go to the "(.*?)" page for the blog post "(.*?)"$/) do |action, title|
  blog_post = BlogPost.where(title: title).first
  if action == 'show'
    visit url_for(blog_post)
  else
    visit url_for([action, blog_post])
  end
end


Then(/^I should be on the "(.*?)" page for the blog post "(.*?)"$/) do |action, title|
  blog_post = BlogPost.where(title: title).first
  if action == 'show'
    expected_url = url_for(blog_post)
  else
    expected_url = url_for([action, blog_post])
  end  
  expect(current_url).to eq(expected_url)
end
