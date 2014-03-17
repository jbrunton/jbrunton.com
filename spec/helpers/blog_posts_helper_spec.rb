require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the BlogPostsHelper. For example:
#
# describe BlogPostsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
describe BlogPostsHelper do
  describe "#prettydate" do
    it "formats the date" do
      date = DateTime.new(2013, 5, 1)
      expect(helper.prettydate(date)).to eq("1 May, 2013")
    end
  end
  
  describe "#preview" do
    it "returns a preview up to the character limit" do
      expect(helper.preview("<p>Foo</p><p>Bar</p>", 3)).to eq("<p>Foo</p>\n")
    end
    
    it "always returns at least one paragraph" do
      # a little over the limit, but returns it anyway
      expect(helper.preview("<p>Foo</p><p>Bar</p>", 2)).to eq("<p>Foo</p>\n")
    end
  end
end
