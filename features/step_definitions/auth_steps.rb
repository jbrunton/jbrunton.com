Given(/^I am authenticated$/) do
  login_as(create(:user), :scope => :user)
end

Given(/^I am an admin$/) do
  ENV['ADMIN_USERS'] = OmniAuth.config.mock_auth[:facebook].uid
end

Given(/^I am not an admin$/) do
  # NO OP
end
