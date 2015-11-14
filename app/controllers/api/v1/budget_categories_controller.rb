class Api::V1::BudgetCategoriesController < Api::V1::BaseController
  load_and_authorize_resource :budget_domain
  load_and_authorize_resource :through => :budget_domain
  # load_and_authorize_resource only: %i[index]
  # load_and_authorize_resource param_method: :update_params, on: :update
  # load_and_authorize_resource param_method: :create_params, on: :create

  def index
    render json: @budget_categories
    # render json: @budget_domain
  end
end
