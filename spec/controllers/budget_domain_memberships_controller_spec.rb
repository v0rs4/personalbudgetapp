RSpec.describe BudgetDomainMembershipsController, type: :controller do
  let(:owner) { create(:user_with_budget_domains) }
  let!(:budget_domain) { owner.budget_domains.last }
  let!(:user) { create(:user) }

  describe 'GET #join' do
    let(:data) do
      { user_id: user.id, budget_domain_id: budget_domain.id }
    end

    let(:token) do
      JWTEncoder.call(data: data).result[:token]
    end

    it 'joins a user to a budget domain' do
      expect {
        get :join, { token: token }
      }.to change(BudgetDomainMembership, :count).by(1)
    end
  end

  describe 'DELETE #destroy' do
    let!(:membership) do
      create(:budget_domain_membership,
        user_id: user.id,
        budget_domain_id: budget_domain.id
      )
    end

    context 'when user is logged in' do
      before(:example) do
        sign_in owner
      end

      it 'destroys the requested membership' do
        expect {
          delete :destroy, { id: membership.to_param }
        }.to change(BudgetDomainMembership, :count).by(-1)
      end

      it "redirects to the budget_domains list" do
        delete :destroy, { id: membership.to_param}
        expect(response).to redirect_to(budget_domains_url)
      end

      it "sets notice flash to 'Budget domain membership was successfully destroyed.'" do
        delete :destroy, { id: membership.to_param}
        expect(controller).to set_flash[:notice].to('Budget domain membership was successfully destroyed.')
      end
    end

    context 'when user is logged out' do
      it "redirects to the budget_domains list" do
        delete :destroy, { id: membership.to_param}
        expect(response).to redirect_to(new_user_session_url)
      end
    end
  end
end
