FactoryGirl.define do
  factory :membership do
    user_id { fail(NotImplemetedError) }
    budget_domain_id { fail(NotImplemetedError) }
    role 0
    permission_bitmask 0
  end
end
