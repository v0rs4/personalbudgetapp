RSpec.describe BudgetIncomesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # BudgetIncome. As you add validations to BudgetIncome, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # BudgetIncomesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all budget_incomes as @budget_incomes" do
      budget_income = BudgetIncome.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:budget_incomes)).to eq([budget_income])
    end
  end

  describe "GET #show" do
    it "assigns the requested budget_income as @budget_income" do
      budget_income = BudgetIncome.create! valid_attributes
      get :show, {:id => budget_income.to_param}, valid_session
      expect(assigns(:budget_income)).to eq(budget_income)
    end
  end

  describe "GET #new" do
    it "assigns a new budget_income as @budget_income" do
      get :new, {}, valid_session
      expect(assigns(:budget_income)).to be_a_new(BudgetIncome)
    end
  end

  describe "GET #edit" do
    it "assigns the requested budget_income as @budget_income" do
      budget_income = BudgetIncome.create! valid_attributes
      get :edit, {:id => budget_income.to_param}, valid_session
      expect(assigns(:budget_income)).to eq(budget_income)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new BudgetIncome" do
        expect {
          post :create, {:budget_income => valid_attributes}, valid_session
        }.to change(BudgetIncome, :count).by(1)
      end

      it "assigns a newly created budget_income as @budget_income" do
        post :create, {:budget_income => valid_attributes}, valid_session
        expect(assigns(:budget_income)).to be_a(BudgetIncome)
        expect(assigns(:budget_income)).to be_persisted
      end

      it "redirects to the created budget_income" do
        post :create, {:budget_income => valid_attributes}, valid_session
        expect(response).to redirect_to(BudgetIncome.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved budget_income as @budget_income" do
        post :create, {:budget_income => invalid_attributes}, valid_session
        expect(assigns(:budget_income)).to be_a_new(BudgetIncome)
      end

      it "re-renders the 'new' template" do
        post :create, {:budget_income => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested budget_income" do
        budget_income = BudgetIncome.create! valid_attributes
        put :update, {:id => budget_income.to_param, :budget_income => new_attributes}, valid_session
        budget_income.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested budget_income as @budget_income" do
        budget_income = BudgetIncome.create! valid_attributes
        put :update, {:id => budget_income.to_param, :budget_income => valid_attributes}, valid_session
        expect(assigns(:budget_income)).to eq(budget_income)
      end

      it "redirects to the budget_income" do
        budget_income = BudgetIncome.create! valid_attributes
        put :update, {:id => budget_income.to_param, :budget_income => valid_attributes}, valid_session
        expect(response).to redirect_to(budget_income)
      end
    end

    context "with invalid params" do
      it "assigns the budget_income as @budget_income" do
        budget_income = BudgetIncome.create! valid_attributes
        put :update, {:id => budget_income.to_param, :budget_income => invalid_attributes}, valid_session
        expect(assigns(:budget_income)).to eq(budget_income)
      end

      it "re-renders the 'edit' template" do
        budget_income = BudgetIncome.create! valid_attributes
        put :update, {:id => budget_income.to_param, :budget_income => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested budget_income" do
      budget_income = BudgetIncome.create! valid_attributes
      expect {
        delete :destroy, {:id => budget_income.to_param}, valid_session
      }.to change(BudgetIncome, :count).by(-1)
    end

    it "redirects to the budget_incomes list" do
      budget_income = BudgetIncome.create! valid_attributes
      delete :destroy, {:id => budget_income.to_param}, valid_session
      expect(response).to redirect_to(budget_incomes_url)
    end
  end

end
