require 'spec_helper'

describe "blog_posts/show", :type => :view do
  before(:each) do
    @blog_post = assign(:blog_post, stub_model(BlogPost,
      :title => "Title",
      :jump => "MyJumpText",
      :body => "MyBodyText",
      :created_at => DateTime.now
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyJumpText/)
    expect(rendered).to match(/MyBodyText/)
  end
end
