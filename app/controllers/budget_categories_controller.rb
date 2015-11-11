class BudgetCategoriesController < ApplicationController
  before_action :set_budget_category, only: [:show, :edit, :update, :destroy]
  before_action :set_budget_domain
  before_action :authenticate_user!

  # GET /budget_categories
  def index
    @budget_domain = BudgetDomain.find(params[:budget_domain_id])
    @budget_categories = @budget_domain.budget_categories
  end

  # GET /budget_categories/1
  def show
  end

  # GET /budget_categories/new
  def new
    @budget_category = BudgetCategory.new
  end

  # GET /budget_categories/1/edit
  def edit
  end

  # POST /budget_categories
  def create
    @budget_category = @budget_domain.budget_categories.build(budget_category_params)

    if @budget_category.save
      redirect_to budget_domain_budget_categories_path(@budget_domain), notice: 'Budget category was successfully created.'
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

  def set_budget_domain
    @budget_domain = BudgetDomain.find(params[:budget_domain_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_budget_category
    @budget_category = BudgetCategory.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def budget_category_params
    params.require(:budget_category).permit(:name, :kind)
  end
end
