require 'spec_helper'

describe "shared/_menu.html.erb", :type => :view do
  include ApplicationHelper
  
  it "includes links to pages" do
    page = create(:page, title: 'Some Page')
    render
    rendered.should have_link('Some Page', :href => friendly_page_path(page))
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
