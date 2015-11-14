class BudgetIncomesController < ApplicationController
  load_and_authorize_resource :budget_domain
  load_and_authorize_resource :through => :budget_domain

  rescue_from CanCan::AccessDenied do |e|
    flash[:error] = 'Access Denied'
    redirect_to budget_domain_budget_incomes_path(@budget_domain)
  end

  # GET /budget_incomes
  def index
  end

  # GET /budget_incomes/1
  def show
  end

  # GET /budget_incomes/new
  def new
  end

  # GET /budget_incomes/1/edit
  def edit
  end

  # POST /budget_incomes
  def create
    @budget_income = BudgetIncome.new(new_budget_income_params)

    if @budget_income.save
      redirect_to [@budget_domain, @budget_income], notice: 'Budget income was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /budget_incomes/1
  def update
    if @budget_income.update(budget_income_params)
      redirect_to [@budget_domain, @budget_income], notice: 'Budget income was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /budget_incomes/1
  def destroy
    @budget_income.destroy
    redirect_to budget_domain_budget_incomes_path(@budget_domain), notice: 'Budget income was successfully destroyed.'
  end

  private

  def new_budget_income_params
    budget_income_params.merge(
      budget_domain_id: params[:budget_domain_id],
      user_id: current_user.id
    )
  end

  # Only allow a trusted parameter "white list" through.
  def budget_income_params
    params.require(:budget_income).permit(:budget_account_id, :amount, :budget_category_id, :comment)
  end
end
