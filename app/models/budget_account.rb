class BudgetAccount < ActiveRecord::Base
  CURRENCY_CODES = [
    :usd,
    :uah,
    :eur
  ].freeze

  enum currency_code: Hash[CURRENCY_CODES.map { |x| [x, x.to_s] }]

  validates :name, presence: true
  validates :currency_code, inclusion: { in: CURRENCY_CODES.map(&:to_s) }

  belongs_to :budget_domain
end
