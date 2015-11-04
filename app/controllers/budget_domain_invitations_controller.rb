class BudgetDomainInvitationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @budget_domain = BudgetDomain.find(params[:budget_domain_id])
    @budget_domain_invitation = BudgetDomainInvitation.new(
      budget_domain_id: @budget_domain.id
    )
  end

  def create
    @budget_domain = BudgetDomain.find(params[:budget_domain_id])
    @budget_domain_invitation = BudgetDomainInvitation.new(permitted_params)
    respond_to do |format|
      if @budget_domain_invitation.send_invitation
        format.html { redirect_to budget_domains_path, notice: 'An invitation was successfully sent.' }
      else
        format.html { render :new }
        # format.html { render inline: '123' }
      end
    end
  end

  private

  def permitted_params
    params.require(:budget_domain_invitation).permit(:email).merge(params.permit(:budget_domain_id))
  end
end
