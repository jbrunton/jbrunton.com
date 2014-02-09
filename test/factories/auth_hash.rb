FactoryGirl.define do
  factory :info_hash, :class => OmniAuth::AuthHash::InfoHash do
    initialize_with { OmniAuth::AuthHash::InfoHash.new }
  end
  
  factory :auth_hash, :class => OmniAuth::AuthHash do
    uid "abc123"
    info { build(:info_hash) }
    
    ignore do
      info_name "Joe Bloggs"
    end
    
    initialize_with { OmniAuth.config.mock_auth[:facebook].dup }
    
    after(:build) do |auth_hash, evaluator|
      auth_hash.info.name = evaluator.info_name
    end
  end
end
