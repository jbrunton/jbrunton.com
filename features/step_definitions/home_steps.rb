Given(/^I am on the home page$/) do
  visit root_url
end

Then(/^I should see the text "(.*?)"$/) do |expected_text|
  expect(page).to have_content(expected_text)
end
