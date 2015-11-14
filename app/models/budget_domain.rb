class BudgetDomain < ActiveRecord::Base
  has_many :budget_domain_memberships, dependent: :destroy
  has_many :budget_categories, dependent: :destroy
  has_many :budget_accounts, dependent: :destroy
  has_many :budget_expenses, dependent: :destroy
  has_many :budget_incomes, dependent: :destroy
  has_many :budget_plans, dependent: :destroy
  has_many :budget_debts, dependent: :destroy

  has_many :users, through: :budget_domain_memberships

  alias_attribute :memberships, :budget_domain_memberships
  alias_attribute :categories, :budget_categories
  alias_attribute :accounts, :budget_accounts
  alias_attribute :expenses, :budget_expenses
  alias_attribute :incomes, :budget_incomes
  alias_attribute :plans, :budget_plans
  alias_attribute :debts, :budget_debts

  validates :name, presence: true
end
