RSpec.describe BudgetDomainsController, type: :controller do
  let!(:user) { create(:user_with_budget_domains) }
  let!(:another_user) { create(:user_with_budget_domains) }
  let!(:budget_domains) { user.budget_domains }
  let!(:budget_domain) { user.budget_domains.last }
  let(:members) { User.with_membership(budget_domain_id: budget_domain.id) }

  before(:example) { sign_in user }

  let(:valid_attributes) { attributes_for(:budget_domain) }

  let(:invalid_attributes) {
    valid_attributes.tap do |attrs|
      attrs[:name] = nil
    end
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all budget_domains as @budget_domains" do
      budget_domain = BudgetDomain.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:budget_domains)).to eq(budget_domains)
    end
  end

  describe "GET #show" do
    it "assigns the requested budget_domain as @budget_domain" do
      get :show, {:id => budget_domain.to_param}, valid_session
      expect(assigns(:budget_domain)).to eq(budget_domain)
      expect(assigns(:members)).to eq(members)
    end
  end

  describe "GET #new" do
    it "assigns a new budget_domain as @budget_domain" do
      get :new, {}, valid_session
      expect(assigns(:budget_domain)).to be_a_new(BudgetDomain)
    end
  end

  describe "GET #edit" do
    it "assigns the requested budget_domain as @budget_domain" do
      get :edit, {:id => budget_domain.to_param}, valid_session
      expect(assigns(:budget_domain)).to eq(budget_domain)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      let(:new_budget_domain) { BudgetDomain.last }
      it "creates a new BudgetDomain" do
        expect {
          post :create, {:budget_domain => valid_attributes}, valid_session
        }.to change(BudgetDomain, :count).by(1)
        expect(new_budget_domain.name).to eq(valid_attributes[:name])
        expect(new_budget_domain.description).to eq(valid_attributes[:description])
      end

      it "assigns a newly created budget_domain as @budget_domain" do
        post :create, {:budget_domain => valid_attributes}, valid_session
        expect(assigns(:budget_domain)).to be_a(BudgetDomain)
        expect(assigns(:budget_domain)).to be_persisted
      end

      it "redirects to the created budget_domain" do
        post :create, {:budget_domain => valid_attributes}, valid_session
        expect(response).to redirect_to(BudgetDomain.last)
      end

      it 'sets notice flash' do
        post :create, {:budget_domain => valid_attributes}, valid_session
        expect(controller).to set_flash[:notice].to('Budget domain was successfully created.')
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved budget_domain as @budget_domain" do
        post :create, {:budget_domain => invalid_attributes}, valid_session
        expect(assigns(:budget_domain)).to be_a_new(BudgetDomain)
      end

      it "re-renders the 'new' template" do
        post :create, {:budget_domain => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { FactoryGirl.attributes_for(:budget_domain) }

      it "updates the requested budget_domain" do
        put :update, {:id => budget_domain.to_param, :budget_domain => new_attributes}, valid_session
        budget_domain.reload
        expect(assigns(:budget_domain)).to eq(budget_domain)
      end

      it "assigns the requested budget_domain as @budget_domain" do
        put :update, {:id => budget_domain.to_param, :budget_domain => valid_attributes}, valid_session
        expect(assigns(:budget_domain)).to eq(budget_domain)
      end

      it "redirects to the budget_domain" do
        put :update, {:id => budget_domain.to_param, :budget_domain => valid_attributes}, valid_session
        expect(response).to redirect_to(budget_domain)
        expect(controller).to set_flash[:notice].to('Budget domain was successfully updated.')
      end
    end

    context "with invalid params" do
      it "assigns the budget_domain as @budget_domain" do
        put :update, {:id => budget_domain.to_param, :budget_domain => invalid_attributes}, valid_session
        expect(assigns(:budget_domain)).to eq(budget_domain)
      end

      it "re-renders the 'edit' template" do
        put :update, {:id => budget_domain.to_param, :budget_domain => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested budget_domain" do
      expect {
        delete :destroy, {:id => budget_domain.to_param}, valid_session
      }.to change(BudgetDomain, :count).by(-1)
    end

    it "redirects to the budget_domains list" do
      delete :destroy, {:id => budget_domain.to_param}, valid_session
      expect(response).to redirect_to(budget_domains_url)
      expect(controller).to set_flash[:notice].to('Budget domain was successfully destroyed.')
    end
  end
end
