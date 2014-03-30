When(/^I enter "(.*?)" into the "(.*?)" field$/) do |text, field|
  fill_in(field, :with => text)
end
