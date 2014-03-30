require 'spec_helper'

describe BlogPost do
  context "#friendly_id" do
    it "has a friendly_id" do
      blog_post = create(:blog_post, title: 'Some Post')
      expect(blog_post.friendly_id).to eq('1-some-post')
    end
    
    it "updates the friendly_id when the title is changed" do
      blog_post = create(:blog_post, title: 'Some Title')
      expect(blog_post.friendly_id).to eq('1-some-title')

      blog_post.title = 'Some Other Title'
      blog_post.save
      expect(blog_post.friendly_id).to eq('1-some-other-title')
    end
  end
end
