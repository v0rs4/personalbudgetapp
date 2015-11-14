class Api::V1::BudgetDomainsController < Api::V1::BaseController
  load_and_authorize_resource only: %i[index]
  serialization_scope :current_ability

  def index
    render json: @budget_domains, each_serializer: Api::V1::BudgetDomainSerializer
  end
end
