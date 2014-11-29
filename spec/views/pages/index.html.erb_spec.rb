require 'spec_helper'

describe "pages/index", :type => :view do
  before(:each) do
    assign(:pages, [
      stub_model(Page,
        :title => "Title",
        :content => "MyText"
      ),
      stub_model(Page,
        :title => "Title",
        :content => "MyText"
      )
    ])
  end

  it "renders a list of pages" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
