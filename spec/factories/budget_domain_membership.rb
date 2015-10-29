FactoryGirl.define do
  factory :budget_domain_membership do
    user_id { fail(NotImplemetedError) }
    budget_domain_id { fail(NotImplemetedError) }
    role 'member'
  end
end
