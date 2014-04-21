require 'spec_helper'

describe Ability do
  context 'Users' do
    subject(:ability) { Ability.new(user) }

    context 'for any user' do
      let(:user) { create(:user) }

      it 'grants read permissions for published posts' do
        blog_post = create(:blog_post, published: true)
        assert ability.can?(:read, blog_post)
      end

      it 'restricts reading of draft posts' do
        blog_post = create(:blog_post, published: false)
        assert ability.cannot?(:read, blog_post)
      end
    end

    context 'for admins' do
      let(:user) { create(:user, :admin) }

      it 'grants read permissions for draft posts' do
        blog_post = create(:blog_post, published: false)
        assert ability.can?(:read, blog_post)
      end
    end
  end
end
