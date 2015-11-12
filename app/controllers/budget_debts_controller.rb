class BudgetDebtsController < ApplicationController
  before_action :set_budget_debt, only: [:show, :edit, :update, :destroy]
  before_action :set_budget_domain
  before_action :authenticate_user!
  before_action :authorize_budget_domain, only: [:edit, :update, :create, :destroy]

  # GET /budget_debts
  def index
    @budget_debts = BudgetDebt.all
  end

  # GET /budget_debts/1
  def show
  end

  # GET /budget_debts/new
  def new
    @budget_debt = BudgetDebt.new
  end

  # GET /budget_debts/1/edit
  def edit
  end

  # POST /budget_debts
  def create
    @budget_debt = BudgetDebt.new(new_budget_debt_params)

    if @budget_debt.save
      redirect_to [@budget_domain, @budget_debt], notice: 'Budget debt was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /budget_debts/1
  def update
    if @budget_debt.update(budget_debt_params)
      redirect_to [@budget_domain, @budget_debt], notice: 'Budget debt was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /budget_debts/1
  def destroy
    @budget_debt.destroy
    redirect_to budget_domain_budget_debts_path(@budget_domain), notice: 'Budget debt was successfully destroyed.'
  end

  private

  def set_budget_domain
    @budget_domain = BudgetDomain.find(params[:budget_domain_id])
  end

  def authorize_budget_domain
    authorize! :update, @budget_domain
  rescue CanCan::AccessDenied
    redirect_to budget_domain_budget_debts_path(@budget_domain)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_budget_debt
    @budget_debt = BudgetDebt.find(params[:id])
  end

  def new_budget_debt_params
    budget_debt_params.merge(
      budget_domain_id: params[:budget_domain_id],
      user_id: current_user.id
    )
  end

  # Only allow a trusted parameter "white list" through.
  def budget_debt_params
    params.require(:budget_debt).permit(:budget_account_id, :amount, :comment)
  end
end
