FactoryGirl.define do
  factory :blog_post do
    sequence(:title) { |n| "Blog Post #{n}" }
    content "Lorem Ipsum"
  end
end
