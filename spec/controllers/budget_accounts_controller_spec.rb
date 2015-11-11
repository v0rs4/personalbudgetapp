RSpec.describe BudgetAccountsController, type: :controller do
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # BudgetAccountsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all budget_accounts as @budget_accounts" do
      budget_account = BudgetAccount.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:budget_accounts)).to eq([budget_account])
    end
  end

  describe "GET #show" do
    it "assigns the requested budget_account as @budget_account" do
      budget_account = BudgetAccount.create! valid_attributes
      get :show, {:id => budget_account.to_param}, valid_session
      expect(assigns(:budget_account)).to eq(budget_account)
    end
  end

  describe "GET #new" do
    it "assigns a new budget_account as @budget_account" do
      get :new, {}, valid_session
      expect(assigns(:budget_account)).to be_a_new(BudgetAccount)
    end
  end

  describe "GET #edit" do
    it "assigns the requested budget_account as @budget_account" do
      budget_account = BudgetAccount.create! valid_attributes
      get :edit, {:id => budget_account.to_param}, valid_session
      expect(assigns(:budget_account)).to eq(budget_account)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new BudgetAccount" do
        expect {
          post :create, {:budget_account => valid_attributes}, valid_session
        }.to change(BudgetAccount, :count).by(1)
      end

      it "assigns a newly created budget_account as @budget_account" do
        post :create, {:budget_account => valid_attributes}, valid_session
        expect(assigns(:budget_account)).to be_a(BudgetAccount)
        expect(assigns(:budget_account)).to be_persisted
      end

      it "redirects to the created budget_account" do
        post :create, {:budget_account => valid_attributes}, valid_session
        expect(response).to redirect_to(BudgetAccount.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved budget_account as @budget_account" do
        post :create, {:budget_account => invalid_attributes}, valid_session
        expect(assigns(:budget_account)).to be_a_new(BudgetAccount)
      end

      it "re-renders the 'new' template" do
        post :create, {:budget_account => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested budget_account" do
        budget_account = BudgetAccount.create! valid_attributes
        put :update, {:id => budget_account.to_param, :budget_account => new_attributes}, valid_session
        budget_account.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested budget_account as @budget_account" do
        budget_account = BudgetAccount.create! valid_attributes
        put :update, {:id => budget_account.to_param, :budget_account => valid_attributes}, valid_session
        expect(assigns(:budget_account)).to eq(budget_account)
      end

      it "redirects to the budget_account" do
        budget_account = BudgetAccount.create! valid_attributes
        put :update, {:id => budget_account.to_param, :budget_account => valid_attributes}, valid_session
        expect(response).to redirect_to(budget_account)
      end
    end

    context "with invalid params" do
      it "assigns the budget_account as @budget_account" do
        budget_account = BudgetAccount.create! valid_attributes
        put :update, {:id => budget_account.to_param, :budget_account => invalid_attributes}, valid_session
        expect(assigns(:budget_account)).to eq(budget_account)
      end

      it "re-renders the 'edit' template" do
        budget_account = BudgetAccount.create! valid_attributes
        put :update, {:id => budget_account.to_param, :budget_account => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested budget_account" do
      budget_account = BudgetAccount.create! valid_attributes
      expect {
        delete :destroy, {:id => budget_account.to_param}, valid_session
      }.to change(BudgetAccount, :count).by(-1)
    end

    it "redirects to the budget_accounts list" do
      budget_account = BudgetAccount.create! valid_attributes
      delete :destroy, {:id => budget_account.to_param}, valid_session
      expect(response).to redirect_to(budget_accounts_url)
    end
  end

end
