Given(/^I have a Facebook account$/) do
  auth_hash = OmniAuth.config.mock_auth[:facebook]
  create(:user, uid: auth_hash.uid, name: auth_hash.info.name)
end
