Given(/^I am authenticated( as an admin)?$/) do |admin|
  if admin
    ENV['ADMIN_USERS'] = OmniAuth.config.mock_auth[:facebook].uid
  end
  login_as(create(:user, uid: OmniAuth.config.mock_auth[:facebook].uid), :scope => :user)
end

Given(/^I am an admin$/) do
  ENV['ADMIN_USERS'] = OmniAuth.config.mock_auth[:facebook].uid
end

Given(/^I am not an admin$/) do
  # NO OP
end
