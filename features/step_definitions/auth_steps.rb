Given(/^I am authenticated$/) do
  login_as(create(:user), :scope => :user)
end
