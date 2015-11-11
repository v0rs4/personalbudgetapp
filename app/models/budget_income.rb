class BudgetIncome < ActiveRecord::Base
  belongs_to :user
  belongs_to :budget_domain
  belongs_to :budget_account
  belongs_to :budget_category

  validates :amount, numericality: true
  validates :budget_account_id, presence: true
  validates :budget_category_id, presence: true
  validates :comment, presence: true, allow_blank: true
end
