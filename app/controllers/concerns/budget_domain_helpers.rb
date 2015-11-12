module BudgetDomainHelpers
  extend ActiveSupport::Concern

  included do
    before_action :set_budget_domain
    before_action :authorize_create, only: [:create, :new]
    before_action :authorize_update, only: [:edit, :update]
    before_action :authorize_destroy, only: :destroy
    before_action :set_cancan_helpers, only: [:index, :show]
    rescue_from CanCan::AccessDenied, with: :cancan_access_denied
  end

  private

  def set_budget_domain
    @budget_domain = BudgetDomain.find(params[:budget_domain_id])
  end

  def set_cancan_helpers
    @can_update = can? :update, @budget_domain
    @can_create = can? :create, @budget_domain
    @can_destroy = can? :destroy, @budget_domain
  end

  def authorize_update
    authorize! :update, @budget_domain
  end

  def authorize_create
    authorize! :create, @budget_domain
  end

  def authorize_destroy
    authorize! :destroy, @budget_domain
  end

  def cancan_access_denied
    redirect_to budget_domain_path(@budget_domain)
  end
end
