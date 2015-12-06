class Api::V1::BudgetTransactionsController < Api::V1::BaseController
  authorize_resource :budget_domain
  authorize_resource :through => :budget_domain

  def index
    sleep(3)
    @budget_transactions = BudgetTransaction.accessible_by(current_ability).includes(:budget_account).includes(:budget_category).includes(:user)
    render json: @budget_transactions, each_serializer: Api::V1::BudgetTransactionSerializer
  end
end
