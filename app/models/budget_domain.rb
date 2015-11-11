class BudgetDomain < ActiveRecord::Base
  has_many :budget_domain_memberships, dependent: :destroy
  has_many :users, through: :budget_domain_memberships
  has_many :budget_categories

  alias_attribute :memberships, :budget_domain_memberships
  alias_attribute :categories, :budget_categories

  validates :name, presence: true
end
