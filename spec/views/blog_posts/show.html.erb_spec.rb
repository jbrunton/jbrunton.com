require 'spec_helper'

describe "blog_posts/show" do
  before(:each) do
    @blog_post = assign(:blog_post, stub_model(BlogPost,
      :title => "Title",
      :content => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
  end
end
