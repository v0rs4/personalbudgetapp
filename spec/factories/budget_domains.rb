FactoryGirl.define do
  factory :budget_domain do
    name { FFaker::Lorem.word }
    description { FFaker::Lorem.sentence }
  end
end
