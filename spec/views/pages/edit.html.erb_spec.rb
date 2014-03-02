require 'spec_helper'

describe "pages/edit" do
  before(:each) do
    @page = assign(:page, stub_model(Page,
      :title => "MyString",
      :content => "MyText"
    ))
  end

  it "renders the edit page form" do
    render

    assert_select "form[action=?][method=?]", page_path(@page), "post" do
      assert_select "input#page_title[name=?]", "page[title]"
      assert_select "textarea#page_content[name=?]", "page[content]"
    end
  end
end
