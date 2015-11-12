class BudgetDebt < ActiveRecord::Base
    belongs_to :user
    belongs_to :budget_domain
    belongs_to :budget_account

    validates :amount, numericality: true
    validates :budget_account_id, presence: true
    validates :comment, presence: true
end
