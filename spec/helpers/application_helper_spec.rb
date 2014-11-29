require 'spec_helper'

describe ApplicationHelper, :type => :helper do
  describe "#friendly_page_path" do
    it "returns the friendly url for a page" do
      page = create(:page, :title => 'Some Page')
      expect(helper.friendly_page_path(page)).to eq("/some-page")
    end
  end
  
  describe "#markdown" do
    it "generates HTML for the given markdown" do
      expect(helper.markdown("foo")).to eq("<p>foo</p>\n")
    end
    
    it "returns an empty string when passed nil as an argument" do
      expect(helper.markdown(nil)).to eq("")
    end
  end
end
