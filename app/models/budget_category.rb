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

  HOME_EXPENSES = [
    :mortage,
    :rent,
    :electricity,
    :gas_oil,
    :water_sewer_trash,
    :other_utilities,
    :mobile_telephone
  ]

  INCOME = [
    :wages,
    :interest_dividends,
    :refunds_reimbursements,
    :transfer_from_savings
  ]

  DAILY_LIVING = [
    :groceries,
    :personal_supplies,
    :clothing,
    :dining_out
  ]

  ENTERTAINMENT = [
    :movies,
    :videogames,
    :books
  ]

  # MAP = Hash[
  #   ENTERTAINMENT.product([:entertainment]) +
  #   HOME_EXPENSES.product([:home_expenses]) +
  #   INCOME.product([:income]) +
  #   DAILY_LIVING.product([:daily_living])
  # ]

  SETS = lambda do
    keys = [:name, :kind]
    [
      [ENTERTAINMENT, :entertainment],
      [HOME_EXPENSES, :home_expenses],
      [INCOME, :income],
      [DAILY_LIVING, :daily_living]
    ].flat_map { |a| a[0].product([a[1]]).map { |x| Hash[keys.zip(x)] } }
  end.call


  enum kind: Hash[KINDS.map { |x| [x, x.to_s] }]

  validates :name, presence: true
  validates :kind, inclusion: { in: KINDS.map(&:to_s) }

  belongs_to :budget_domain

  scope :income_related, -> { where(kind: :income) }
  scope :expense_related, -> { where.not(kind: :income) }
end
