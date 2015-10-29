class BudgetDomainMembershipsController < ApplicationController
  # GET /domains/memberships/join?token=XXXX.XXXX.XXXX
  def create
    payload = decode_invitation_token

    BudgetDomainMembership.create(
      user_id: payload['user_id'],
      budget_domain_id: payload['budget_domain_id']
    )
    flash[:notice] = 'Successfuly'
  rescue JWT::DecodeError, ActiveRecord::RecordNotUnique
    flash[:alert] = 'Invalid token'
  ensure
    respond_to do |format|
      format.html { redirect_to budget_domains_path }
      format.json { head :no_content }
    end
  end

  # DELETE /domains/memberships/:id
  def destroy
    BudgetDomainMembership.find(params[:id]).destroy

    respond_to do |format|
      format.html { redirect_to budget_domains_path, notice: 'Budget domain membership was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

   def decode_invitation_token
    JWT.decode(
      params[:token],
      Rails.application.secrets.secret_jwt,
      true,
      algorithm: 'HS256'
    ).first
  end
end
