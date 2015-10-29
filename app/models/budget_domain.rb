class BudgetDomain < ActiveRecord::Base
  has_many :budget_domain_memberships, dependent: :destroy
  has_many :users, through: :budget_domain_memberships

  alias_attribute :memberships, :budget_domain_memberships

  validates :name, presence: true
end
