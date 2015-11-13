class BudgetDomainInvitationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_budget_domain

  rescue_from CanCan::AccessDenied, with: :authorization_failed

  def new
    authorize! :create, @budget_domain
    @budget_domain_invitation = BudgetDomainInvitation.new(
      budget_domain_id: @budget_domain.id
    )
  end

  def create
    authorize! :create, @budget_domain
    @budget_domain_invitation = BudgetDomainInvitation.new(permitted_params)
    if @budget_domain_invitation.send_invitation
      redirect_to budget_domains_path, notice: 'An invitation was successfully sent.'
    else
      render :new
    end
  end

  private

  def authorization_failed(ex)
    flash[:error] = 'Access Denied'
    redirect_to budget_domain_path(@budget_domain)
  end

  def new_permitted_params
    permitted_params.merge(budget_domain_id: params[:budget_domain_id])
  end

  def permitted_params
    params.require(:budget_domain_invitation).permit(:email)
  end
end
