class BudgetExpensesController < ApplicationController
  load_and_authorize_resource :budget_domain
  load_and_authorize_resource :through => :budget_domain

  rescue_from CanCan::AccessDenied do |e|
    flash[:error] = 'Access Denied'
    redirect_to budget_domain_budget_expenses_path(@budget_domain)
  end

  # GET /budget_expenses
  def index
  end

  # GET /budget_expenses/1
  def show
  end

  # GET /budget_expenses/new
  def new
  end

  # GET /budget_expenses/1/edit
  def edit
  end

  # POST /budget_expenses
  def create
    @budget_expense = BudgetExpense.new(new_budget_expense_params)
    if @budget_expense.save
      redirect_to [@budget_domain, @budget_expense], notice: 'Budget expense was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /budget_expenses/1
  def update
    if @budget_expense.update(budget_expense_params)
      redirect_to [@budget_domain, @budget_expense], notice: 'Budget expense was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /budget_expenses/1
  def destroy
    @budget_expense.destroy
    redirect_to budget_domain_budget_expenses_path(@budget_domain), notice: 'Budget expense was successfully destroyed.'
  end

  private

  def new_budget_expense_params
    budget_expense_params.merge(
      budget_domain_id: params[:budget_domain_id],
      user_id: current_user.id
    )
  end

  # Only allow a trusted parameter "white list" through.
  def budget_expense_params
    params.require(:budget_expense).permit(:budget_account_id, :amount, :budget_category_id, :comment)
  end
end
