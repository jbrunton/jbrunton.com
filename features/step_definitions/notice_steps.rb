Then(/^there should be a notice "(.*?)"$/) do |text|
  expect(page).to have_selector('.alert-box', text: text)
end
