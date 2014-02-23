Given(/^I navigate to "(.*?)"$/) do |url|
  visit url
end

Given(/^I am on the homepage$/) do
  visit root_url
end

When(/^I click "(.*?)"$/) do |link|
  click_link link
end
