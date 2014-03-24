require 'spec_helper'

describe "blog_posts/edit" do
  before(:each) do
    @blog_post = assign(:blog_post, stub_model(BlogPost,
      :title => "MyString",
      :jump => "MyJumpText",
      :body => "MyBodyText"
    ))
  end

  it "renders the edit blog_post form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", blog_post_path(@blog_post), "post" do
      assert_select "input#blog_post_title[name=?]", "blog_post[title]"
      assert_select "textarea#blog_post_jump[name=?]", "blog_post[jump]"
      assert_select "textarea#blog_post_body[name=?]", "blog_post[body]"
    end
  end
end
