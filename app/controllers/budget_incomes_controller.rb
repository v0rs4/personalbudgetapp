class BudgetIncomesController < ApplicationController
  before_action :set_budget_income, only: [:show, :edit, :update, :destroy]
  before_action :set_budget_domain

  # GET /budget_incomes
  def index
    @budget_incomes = BudgetIncome.all
  end

  # GET /budget_incomes/1
  def show
  end

  # GET /budget_incomes/new
  def new
    @budget_income = BudgetIncome.new
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

  def set_budget_domain
    @budget_domain = BudgetDomain.find(params[:budget_domain_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_budget_income
    @budget_income = BudgetIncome.find(params[:id])
  end

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
