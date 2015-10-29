FactoryGirl.define do
  factory :budget_domain do
    name { FFaker::Lorem.word }
    description { FFaker::Lorem.sentence }
    # description { FFaker::Lorem.sentence }

    factory :budget_domain_with_membership do
      transient do
        user { fail(NotImplementedError, '`user: User.find(XXX)` atttribute should be defined') }
      end

      before(:create) do |budget_domain, evaluator|
        budget_domain.memberships.build(user_id: evaluator.user.id)
      end
    end
  end
end
