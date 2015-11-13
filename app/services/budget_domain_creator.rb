class BudgetDomainCreator
  include Service

  attr_accessor :params
  attr_accessor :user_id

  attr_reader :budget_domain
  attr_reader :membership

  # CATEGORIES_SETS = lambda do
  #   keys = [:name,:kind]
  #   [
  #     [BudgetCategory::ENTERTAINMENT, :entertainment],
  #     [BudgetCategory::HOME_EXPENSES, :home_expenses],
  #     [BudgetCategory::INCOME, :income],
  #     [BudgetCategory::DAILY_LIVING, :daily_livig]
  #   ].flat_map { |a| a[0].product([a[1]]).map { |x| Hash[keys.zip(x)] } }
  # end.call

  def call
    @budget_domain = BudgetDomain.new(params)
    BudgetDomain.transaction do
      build_membership
      build_categories
      @budget_domain.save!
    end
    @status = :ok
  rescue StandardError
    @status = :failed
  end

  private

  def build_membership
    @budget_domain.memberships.build(
        user_id: user_id,
        role: :admin
      )
  end

  def build_categories
    @budget_domain.categories.build(BudgetCategory::SETS)
  end
end
