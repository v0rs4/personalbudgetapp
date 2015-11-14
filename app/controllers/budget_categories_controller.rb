class BudgetCategoriesController < ApplicationController
  load_and_authorize_resource :budget_domain
  load_and_authorize_resource :through => :budget_domain

  rescue_from CanCan::AccessDenied do |e|
    flash[:error] = 'Access Denied'
    redirect_to budget_domain_budget_categories_path(@budget_domain)
  end

  # GET /budget_categories
  def index
  end

  # GET /budget_categories/1
  def show
  end

  # GET /budget_categories/new
  def new
    # @budget_category = BudgetCategory.new
  end

  # GET /budget_categories/1/edit
  def edit
  end

  # POST /budget_categories
  def create
    @budget_category = @budget_domain.budget_categories.build(budget_category_params)
    if @budget_category.save
      redirect_to budget_domain_budget_categories_path(@budget_domain), notice: 'Budget category was successfully created!!11.'
    else
      render :new
    end
  end

  # PATCH/PUT /budget_categories/1
  def update
    if @budget_category.update(budget_category_params)
      redirect_to budget_domain_budget_categories_path(@budget_domain), notice: 'Budget category was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /budget_categories/1
  def destroy
    @budget_category.destroy
    redirect_to budget_domain_budget_categories_path(@budget_domain), notice: 'Budget category was successfully destroyed.'
  end

  private

  # Only allow a trusted parameter "white list" through.
  def budget_category_params
    params.require(:budget_category).permit(:name, :kind)
  end
end
