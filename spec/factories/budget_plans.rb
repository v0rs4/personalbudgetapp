FactoryGirl.define do
  factory :budget_plan do
    budget_domain_id 1
    budget_category_id 1
    planned_amount "9.99"
    actual_amount "9.99"
    year 2015
    month 1
  end
end
