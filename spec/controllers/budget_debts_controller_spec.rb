RSpec.describe BudgetDebtsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # BudgetDebt. As you add validations to BudgetDebt, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # BudgetDebtsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all budget_debts as @budget_debts" do
      budget_debt = BudgetDebt.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:budget_debts)).to eq([budget_debt])
    end
  end

  describe "GET #show" do
    it "assigns the requested budget_debt as @budget_debt" do
      budget_debt = BudgetDebt.create! valid_attributes
      get :show, {:id => budget_debt.to_param}, valid_session
      expect(assigns(:budget_debt)).to eq(budget_debt)
    end
  end

  describe "GET #new" do
    it "assigns a new budget_debt as @budget_debt" do
      get :new, {}, valid_session
      expect(assigns(:budget_debt)).to be_a_new(BudgetDebt)
    end
  end

  describe "GET #edit" do
    it "assigns the requested budget_debt as @budget_debt" do
      budget_debt = BudgetDebt.create! valid_attributes
      get :edit, {:id => budget_debt.to_param}, valid_session
      expect(assigns(:budget_debt)).to eq(budget_debt)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new BudgetDebt" do
        expect {
          post :create, {:budget_debt => valid_attributes}, valid_session
        }.to change(BudgetDebt, :count).by(1)
      end

      it "assigns a newly created budget_debt as @budget_debt" do
        post :create, {:budget_debt => valid_attributes}, valid_session
        expect(assigns(:budget_debt)).to be_a(BudgetDebt)
        expect(assigns(:budget_debt)).to be_persisted
      end

      it "redirects to the created budget_debt" do
        post :create, {:budget_debt => valid_attributes}, valid_session
        expect(response).to redirect_to(BudgetDebt.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved budget_debt as @budget_debt" do
        post :create, {:budget_debt => invalid_attributes}, valid_session
        expect(assigns(:budget_debt)).to be_a_new(BudgetDebt)
      end

      it "re-renders the 'new' template" do
        post :create, {:budget_debt => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested budget_debt" do
        budget_debt = BudgetDebt.create! valid_attributes
        put :update, {:id => budget_debt.to_param, :budget_debt => new_attributes}, valid_session
        budget_debt.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested budget_debt as @budget_debt" do
        budget_debt = BudgetDebt.create! valid_attributes
        put :update, {:id => budget_debt.to_param, :budget_debt => valid_attributes}, valid_session
        expect(assigns(:budget_debt)).to eq(budget_debt)
      end

      it "redirects to the budget_debt" do
        budget_debt = BudgetDebt.create! valid_attributes
        put :update, {:id => budget_debt.to_param, :budget_debt => valid_attributes}, valid_session
        expect(response).to redirect_to(budget_debt)
      end
    end

    context "with invalid params" do
      it "assigns the budget_debt as @budget_debt" do
        budget_debt = BudgetDebt.create! valid_attributes
        put :update, {:id => budget_debt.to_param, :budget_debt => invalid_attributes}, valid_session
        expect(assigns(:budget_debt)).to eq(budget_debt)
      end

      it "re-renders the 'edit' template" do
        budget_debt = BudgetDebt.create! valid_attributes
        put :update, {:id => budget_debt.to_param, :budget_debt => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested budget_debt" do
      budget_debt = BudgetDebt.create! valid_attributes
      expect {
        delete :destroy, {:id => budget_debt.to_param}, valid_session
      }.to change(BudgetDebt, :count).by(-1)
    end

    it "redirects to the budget_debts list" do
      budget_debt = BudgetDebt.create! valid_attributes
      delete :destroy, {:id => budget_debt.to_param}, valid_session
      expect(response).to redirect_to(budget_debts_url)
    end
  end

end
