class StatisticsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_budget_domain
  before_action :authorize_budget_domain

  ##
  # Params
  # - source { e.g. incomes, expenses, debts }
  # - from { e.g. 2015-09-01 }
  # - to { e.g. 2015-11-11 }
  # - display { e.g. pie-chart, comparison-table, etc }
  #
  def index
    respond_to do |f|
      f.json { render json: [] }
    end
  end

  private

  def set_budget_domain
    @budget_domain = BudgetDomain.find(params[:budget_domain_id])
  end

  def authorize_budget_domain
    authorize! :read, @budget_domain
  rescue CanCan::AccessDenied
    redirect_to budget_domain_path(@budget_domain)
  end
end
