RSpec.describe BudgetDomainInvitationsController, type: :controller do
  let!(:user) { create(:user) }
  let!(:another_user) { create(:user) }
  let!(:budget_domain) { create(:budget_domain) }

  before(:example) do
    create(:budget_domain_membership,
      user_id: user.id,
      budget_domain_id: budget_domain.id
    )

    sign_in user
  end

  let(:valid_attributes) do
    {
      email: another_user.email,
      budget_domain_id: budget_domain.id
    }
  end

  let(:invalid_attributes) {
    valid_attributes.tap do |attrs|
      attrs[:email] = nil
    end
  }

  let(:valid_session) { {} }

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
    def make_request
      post :create, { budget_domain_invitation: valid_attributes }, valid_session
    end

    let(:invitation) { ActionMailer::Base.deliveries.last }

    it 'sends an invitation' do
      expect { make_request }.to change(ActionMailer::Base.deliveries, :size).by(1)
      expect(invitation.to).to include(another_user.email)
    end
  end

end
