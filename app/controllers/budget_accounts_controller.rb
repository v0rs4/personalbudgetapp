class BudgetAccountsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_budget_account, only: [:show, :edit, :update, :destroy]

  include BudgetDomainHelpers

  # GET /budget_accounts
  def index
    @budget_accounts = BudgetAccount.all
  end

  # GET /budget_accounts/1
  def show
  end

  # GET /budget_accounts/new
  def new
    @budget_account = BudgetAccount.new
  end

  # GET /budget_accounts/1/edit
  def edit
  end

  # POST /budget_accounts
  def create
    @budget_account = BudgetAccount.new(new_budget_account_params)

    if @budget_account.save
      redirect_to budget_domain_budget_account_path(@budget_domain, @budget_account), notice: 'Budget account was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /budget_accounts/1
  def update
    if @budget_account.update(budget_account_params)
      redirect_to budget_domain_budget_account_path(@budget_domain, @budget_account), notice: 'Budget account was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /budget_accounts/1
  def destroy
    @budget_account.destroy
    redirect_to budget_domain_budget_accounts_path(@budget_domain), notice: 'Budget account was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_budget_account
    @budget_account = BudgetAccount.find(params[:id])
  end

  def new_budget_account_params
    budget_account_params.merge(budget_domain_id: params[:budget_domain_id])
  end

  # Only allow a trusted parameter "white list" through.
  def budget_account_params
    params.require(:budget_account).permit(:name, :description, :currency_code)
  end
end
