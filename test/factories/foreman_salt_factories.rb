FactoryGirl.define do
  factory :smart_proxy, :class => "::SmartProxy" do
    sequence(:name) { |n| "proxy#{n}" }
    sequence(:url)  { |n| "http://proxy#{n}.example.com:9090" }

    trait :with_salt_feature do
      features        { [::Feature.find_or_create_by_name('Salt')] }
    end
  end

  factory :salt_module, :class => "ForemanSalt::SaltModule" do
    sequence(:name) { |n| "module#{n}" }
  end
end

FactoryGirl.modify do
  factory :host do
    trait :with_salt_proxy do
      salt_proxy { FactoryGirl.create :smart_proxy, :with_salt_feature }
    end
  end

  factory :hostgroup do
    trait :with_salt_proxy do
      salt_proxy { FactoryGirl.create :smart_proxy, :with_salt_feature }
    end

    trait :with_salt_modules do
      salt_modules { FactoryGirl.create_list :salt_module, 10 }
    end
  end
end
