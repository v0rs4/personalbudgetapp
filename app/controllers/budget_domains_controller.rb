class BudgetDomainsController < ApplicationController
  before_action :set_budget_domain, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /domains
  # GET /domains.json
  def index
    @budget_domains = current_user.budget_domains
  end

  # GET /domains/1
  # GET /domains/1.json
  def show
    @members = User.with_membership(budget_domain_id: @budget_domain.id)
  end

  # GET /domains/new
  def new
    @budget_domain = BudgetDomain.new
  end

  # GET /domains/1/edit
  def edit
  end

  # POST /domains
  # POST /domains.json
  def create
    service = BudgetDomainCreator.call(
      params: budget_domain_params,
      user_id:  current_user.id
    )
    @budget_domain = service.budget_domain

    respond_to do |format|
      if service.status == :ok
        format.html { redirect_to @budget_domain, notice: 'Budget domain was successfully created.' }
        format.json { render :show, status: :created, location: @budget_domain }
      else
        format.html { render :new }
        format.json { render json: @budget_domain.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /domains/1
  # PATCH/PUT /domains/1.json
  def update
    respond_to do |format|
      if @budget_domain.update(budget_domain_params)
        format.html { redirect_to @budget_domain, notice: 'Budget domain was successfully updated.' }
        format.json { render :show, status: :ok, location: @budget_domain }
      else
        format.html { render :edit }
        format.json { render json: @budget_domain.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /domains/1
  # DELETE /domains/1.json
  def destroy
    @budget_domain.destroy
    respond_to do |format|
      format.html { redirect_to budget_domains_path, notice: 'Budget domain was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_budget_domain
    @budget_domain = current_user.budget_domains.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def budget_domain_params
    params.require(:budget_domain).permit(:name, :description)
  end
end
