class BudgetDomainMembership < ActiveRecord::Base
  belongs_to :user
  belongs_to :budget_domain

  enum role: {
    member: 'member',
    manager: 'manager',
    admin: 'admin'
  }
end
