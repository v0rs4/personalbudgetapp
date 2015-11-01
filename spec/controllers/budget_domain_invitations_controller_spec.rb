RSpec.describe BudgetDomainInvitationsController, type: :controller do
  let!(:user) { create(:user) }
  let!(:another_user) { create(:user) }
  let!(:budget_domain) { create(:budget_domain) }

  let(:valid_attributes) do
    {
      email: another_user.email,
      budget_domain_id: budget_domain.id
    }
  end

  let(:invalid_attributes) {
    valid_attributes.tap do |attrs|
      attrs[:budget_domain_id] = 0
    end
  }

  let(:valid_session) { {} }

  before(:example) do
    create(:budget_domain_membership,
      user_id: user.id,
      budget_domain_id: budget_domain.id
    )
    sign_in user
  end

  describe "GET #new" do
    let!(:budget_domain_invitation) {BudgetDomainInvitation.new(valid_attributes) }

    before(:example) do
      get :new, {}, valid_session
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "assigns a newly created but unsaved budget_domain_invitation as @budget_domain_invitation" do
      expect(assigns(:budget_domain_invitation)).to be_a(BudgetDomainInvitation)
    end
  end

  describe "POST #create" do
    def make_request(attrs)
      post :create, { budget_domain_invitation: attrs }, valid_session
    end

    let(:invitation) { ActionMailer::Base.deliveries.last }

    context 'when params are valid' do
      it 'sends an invitation' do
        expect {
          make_request(valid_attributes)
        }.to change(ActionMailer::Base.deliveries, :size).by(1)
        expect(invitation.to).to include(another_user.email)
      end
    end

    context 'when params are valid' do
      let(:budget_domain_id) { 0 }

      it 'does not sends an invitation' do
        expect {
          make_request(invalid_attributes)
        }.to change(ActionMailer::Base.deliveries, :size).by(0)
      end

      it 'renders :new' do
        make_request(invalid_attributes)
        expect(controller).to render_template('new')
      end
    end
  end
end
