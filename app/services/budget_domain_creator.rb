class BudgetDomainCreator
  include Service

  attr_accessor :params
  attr_accessor :user_id

  attr_reader :budget_domain
  attr_reader :membership

  def call
    @budget_domain = BudgetDomain.new(params)
    BudgetDomain.transaction do
      @budget_domain.memberships.build(
        user_id: user_id,
        role: :admin
      )
      @budget_domain.save!
    end
    @status = :ok
  rescue StandardError
    @status = :failed
  end
end
