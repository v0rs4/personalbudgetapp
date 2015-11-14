class BudgetDebtsController < ApplicationController
  load_and_authorize_resource :budget_domain
  load_and_authorize_resource :through => :budget_domain

  rescue_from CanCan::AccessDenied do |e|
    flash[:error] = 'Access Denied'
    redirect_to budget_domain_budget_debts_path(@budget_domain)
  end

  # GET /budget_debts
  def index
  end

  # GET /budget_debts/1
  def show
  end

  # GET /budget_debts/new
  def new
  end

  # GET /budget_debts/1/edit
  def edit
  end

  # POST /budget_debts
  def create
    authorize! :create, @budget_domain
    @budget_debt = BudgetDebt.new(new_budget_debt_params)
    if @budget_debt.save
      redirect_to [@budget_domain, @budget_debt], notice: 'Budget debt was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /budget_debts/1
  def update
    authorize! :update, @budget_domain
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
