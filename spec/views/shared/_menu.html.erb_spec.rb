require 'spec_helper'

describe "shared/_menu.html.erb" do
  context "when the current user is not authenticated" do
    it "includes a 'Sign in' link" do
      render
      rendered.should have_link('Sign in with Facebook', :href => user_omniauth_authorize_path(:facebook))
    end
  end

  context "when the current user is authenticated" do
    let(:user) { create(:user) }
    before(:each) do
      sign_in user
    end

    it "includes a 'Sign out' link" do
      render
      rendered.should have_link('Sign out', :href => destroy_user_session_path)
    end
  end
end
