Then(/^there should be a notice "(.*?)"$/) do |text|
  expect(page).to have_selector('.alert-box.info', text: text)
end
