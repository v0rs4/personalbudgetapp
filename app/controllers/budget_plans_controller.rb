class BudgetPlansController < ApplicationController
  before_action :authenticate_user!
  before_action :set_budget_domain
  before_action :authorize_budget_domain, only: [:edit, :update, :create, :destroy]
  before_action :set_budget_plan, only: [:show, :edit, :update, :destroy]

  # GET /budget_plans
  def index
    @budget_plans = BudgetPlan.all
  end

  # GET /budget_plans/1
  def show
  end

  # GET /budget_plans/new
  def new
    @budget_plan = BudgetPlan.new
  end

  # GET /budget_plans/1/edit
  def edit
  end

  # POST /budget_plans
  def create
    @budget_plan = BudgetPlan.new(new_budget_plan_params)

    if @budget_plan.save
      redirect_to [@budget_domain, @budget_plan], notice: 'Budget plan was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /budget_plans/1
  def update
    if @budget_plan.update(budget_plan_params)
      redirect_to [@budget_domain, @budget_plan], notice: 'Budget plan was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /budget_plans/1
  def destroy
    @budget_plan.destroy
    redirect_to budget_domain_budget_plans_path(@budget_domain), notice: 'Budget plan was successfully destroyed.'
  end

  private

  def set_budget_domain
    @budget_domain = BudgetDomain.find(params[:budget_domain_id])
  end

  def authorize_budget_domain
    authorize! :update, @budget_domain
  rescue CanCan::AccessDenied
    redirect_to budget_domain_budget_plans_path(@budget_domain)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_budget_plan
    @budget_plan = BudgetPlan.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def budget_plan_params
    params.require(:budget_plan).permit(:budget_category_id, :planned_amount, :actual_amount, :year, :month)
  end

  def new_budget_plan_params
    budget_plan_params.merge(budget_domain_id: params[:budget_domain_id])
  end
end
