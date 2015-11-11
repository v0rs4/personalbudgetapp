FactoryGirl.define do
  factory :budget_category do
    budget_domain_id { fail(ArgumentError) }
    name { FFaker::Lorem.word }
    kind 'income'
  end
end
