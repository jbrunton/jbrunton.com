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
describe BlogPostsHelper, :type => :helper do
  describe "#prettydate" do
    it "formats the date" do
      date = DateTime.new(2013, 5, 1)
      expect(helper.prettydate(date)).to eq("1 MAY, 2013")
    end
  end  
end
