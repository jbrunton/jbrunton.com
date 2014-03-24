FactoryGirl.define do
  factory :blog_post do
    sequence(:title) { |n| "Blog Post #{n}" }
    body "Lorem Ipsum"
    
    after :create do |blog_post, evaluator|
      unless evaluator.created_at.nil?
        Timecop.travel(evaluator.created_at) do
          blog_post.update_attribute :created_at, evaluator.created_at
        end
      end
    end
  end
end
