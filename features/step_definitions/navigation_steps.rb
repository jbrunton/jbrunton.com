Given(/^I navigate to "(.*?)"$/) do |url|
  visit url
end

Given(/^I (?:am on|go to) the (home|admin) page$/) do  |page|
  visit (page == 'home') ? '/' : page
end

When(/^I click "(.*?)"$/) do |link|
  click_link link
end
