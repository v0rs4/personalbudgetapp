class BudgetDomainMembershipsController < ApplicationController
  before_action :authenticate_user!, except: :join
  before_action :set_budget_domain

  rescue_from CanCan::AccessDenied, with: :authorization_failed

  def index
    authorize! :update, @budget_domain
    @memberships = BudgetDomainMembership.includes(:user).where(budget_domain: @budget_domain)
  end

  def edit
    authorize! :update, @budget_domain
    @membership = BudgetDomainMembership.find(params[:id])
  end

  def update
    authorize! :update, @budget_domain
    @membership = BudgetDomainMembership.find(params[:id])
    if @membership.update(membership_params)
        redirect_to budget_domain_memberships_path, notice: 'Budget domain was successfully updated.'
      else
        render :edit
      end
  end

  # GET /domains/memberships/join?token=XXXX.XXXX.XXXX
  def join
    JWTDecoder.call(token: params[:token]).resolve(
      ok: lambda do |service|
        payload = service.result[:payload]
        BudgetDomainMembership.create(
          user_id: payload[:user_id],
          budget_domain_id: payload[:budget_domain_id]
        )
        flash[:notice] = 'Successfuly'
      end,
      any_error: lambda do |_|
        flash[:alert] = 'Invalid token'
      end
    )
  rescue ActiveRecord::RecordNotUnique
    flash[:notice] = 'You are already a member'
  ensure
    redirect_to budget_domains_path
  end

  # DELETE /domains/memberships/:id
  def destroy
    authorize! :destroy, @budget_domain
    BudgetDomainMembership.find(params[:id]).destroy
    redirect_to budget_domains_path, notice: 'Budget domain membership was successfully destroyed.'
  end

  private

  def authorization_failed(ex)
    flash[:error] = 'Access Denied'
    redirect_to budget_domain_path(@budget_domain)
  end

  def membership_params
    params.require(:budget_domain_membership).permit(:role)
  end
end
