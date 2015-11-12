class BudgetDomain < ActiveRecord::Base
  has_many :budget_domain_memberships, dependent: :destroy
  has_many :users, through: :budget_domain_memberships
  has_many :budget_categories
  has_many :budget_accounts
  has_many :budget_expenses
  has_many :budget_incomes

  alias_attribute :memberships, :budget_domain_memberships
  alias_attribute :categories, :budget_categories
  alias_attribute :accounts, :budget_accounts
  alias_attribute :expenses, :budget_expenses
  alias_attribute :incomes, :budget_incomes

  validates :name, presence: true
end
