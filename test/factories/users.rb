# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    trait :admin do
      after(:create) do |user|
        user.add_role :admin
      end
    end
  end
end
