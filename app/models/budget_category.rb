class BudgetCategory < ActiveRecord::Base
  KINDS = [
    :income,
    :home_expenses,
    :savings,
    :obligations,
    :daily_living,
    :children,
    :business_expense,
    :entertainment,
    :pets,
    :transportation,
    :health,
    :subscribtions,
    :insurance,
    :vacation,
    :education,
    :charity_gifts,
    :miscellaneous
  ]

  enum kind: Hash[KINDS.map { |x| [x, x.to_s] }]

  validates :name, presence: true
  validates :kind, inclusion: { in: KINDS.map(&:to_s) }

  belongs_to :budget_domain

  scope :income_related, -> { where(kind: :income) }
  scope :expense_related, -> { where.not(kind: :income) }
end
