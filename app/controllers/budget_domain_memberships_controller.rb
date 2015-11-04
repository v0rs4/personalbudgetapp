class BudgetDomainMembershipsController < ApplicationController
  before_action :authenticate_user!, except: :join

  def index
    @budget_domain = BudgetDomain.find(params[:budget_domain_id])
    @memberships = BudgetDomainMembership.includes(:user).where(
      budget_domain: @budget_domain
    )
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
    BudgetDomainMembership.find(params[:id]).destroy

    respond_to do |format|
      format.html { redirect_to budget_domains_path, notice: 'Budget domain membership was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
end
