class BudgetTransaction < ActiveRecord::Base
  belongs_to :user
  belongs_to :budget_domain
  belongs_to :budget_account
  belongs_to :budget_category
end
