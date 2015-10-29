class BudgetDomainInvitationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @budget_domain_invitation = BudgetDomainInvitation.new(
      budget_domain_id: params[:id]
    )
  end

  def create
    @budget_domain_invitation = BudgetDomainInvitation.new(permitted_params)

    respond_to do |format|
      if @budget_domain_invitation.send_invitation
        format.html { redirect_to budget_domains_path, notice: 'An invitation was successfully sent.' }
      else
        format.html { render :new }
      end
    end
  end

  private

  def permitted_params
    params.require(:budget_domain_invitation).permit(:email, :budget_domain_id)
  end
end
