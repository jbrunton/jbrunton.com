require 'spec_helper'

describe "blog_posts/index", :type => :view do
  before(:each) do
    assign(:blog_posts, [
      stub_model(BlogPost,
        :title => "Title",
        :jump => "MyJumpText",
        :created_at => DateTime.now
      ),
      stub_model(BlogPost,
        :title => "Title",
        :jump => "MyJumpText",
        :created_at => DateTime.now
      )
    ])
  end

  it "renders a list of blog_posts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select ".blog-post .title", :text => "Title".to_s, :count => 2
    assert_select ".blog-post .jump", :text => "MyJumpText".to_s, :count => 2
  end
end
