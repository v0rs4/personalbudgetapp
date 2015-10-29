FactoryGirl.define do
  factory :user do
    email { FFaker::Internet.email }
    password { FFaker::Internet.password }
    factory :user_with_budget_domains do
      transient do
        budget_domains_count 1
      end

      after(:create) do |user, evaluator|
        budget_domains = create_list(:budget_domain_with_membership, evaluator.budget_domains_count, user: user)
      end
    end
  end
end
