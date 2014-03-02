Given(/^I am authenticated( as an admin)?$/) do |admin|
  user = create(:user)
  if admin
    user.add_role :admin
  end
  login_as user    
end

Given(/^I am an admin$/) do
  ENV['admin_users'] = OmniAuth.config.mock_auth[:facebook].uid
end

Given(/^I am not an admin$/) do
  # NO OP
end
