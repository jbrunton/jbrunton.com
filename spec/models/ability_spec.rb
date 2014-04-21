require 'spec_helper'

describe Ability do
  context "Users" do
    it "grants read permissions for published posts to all users" do
      user = create(:user)
      ability = Ability.new(user)
      blog_post = create(:blog_post, published: true)
      assert ability.can?(:read, blog_post)
    end
    
    it "restricts reading draft posts to admins" do
      user = create(:user)
      ability = Ability.new(user)
      blog_post = create(:blog_post, published: false)
      assert ability.cannot?(:read, blog_post)
    end
  end
end
