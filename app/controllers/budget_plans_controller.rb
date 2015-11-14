class BudgetPlansController < ApplicationController
  load_and_authorize_resource :budget_domain
  load_and_authorize_resource :through => :budget_domain

  rescue_from CanCan::AccessDenied do |e|
    flash[:error] = 'Access Denied'
    redirect_to budget_domain_budget_plans_path(@budget_domain)
  end

  # GET /budget_plans
  def index
  end

  # GET /budget_plans/1
  def show
  end

  # GET /budget_plans/new
  def new
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

  # Only allow a trusted parameter "white list" through.
  def budget_plan_params
    params.require(:budget_plan).permit(:budget_category_id, :planned_amount, :actual_amount, :year, :month)
  end

  def new_budget_plan_params
    budget_plan_params.merge(budget_domain_id: params[:budget_domain_id])
  end
end
