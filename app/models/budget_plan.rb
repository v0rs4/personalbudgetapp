class BudgetPlan < ActiveRecord::Base
  belongs_to :budget_domain
  belongs_to :budget_category

  validates :planned_amount, numericality: true
  validates :year, :month, numericality: { only_integer: true }
end
