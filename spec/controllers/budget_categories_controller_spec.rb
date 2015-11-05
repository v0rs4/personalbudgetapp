RSpec.describe BudgetCategoriesController, type: :controller do
  let!(:user) { create(:user) }
  let(:valid_attributes) { attributes_for(:budget_category, user_id: user.id) }
  let(:invalid_attributes) { attributes_for(:budget_category, user_id: user.id, name: nil)}
  let(:valid_session) { {} }

  before(:example) { sign_in user }

  describe "GET #index" do
    it "assigns all budget_categories as @budget_categories" do
      budget_category = BudgetCategory.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:budget_categories)).to eq([budget_category])
    end
  end

  describe "GET #show" do
    it "assigns the requested budget_category as @budget_category" do
      budget_category = BudgetCategory.create! valid_attributes
      get :show, {:id => budget_category.to_param}, valid_session
      expect(assigns(:budget_category)).to eq(budget_category)
    end
  end

  describe "GET #new" do
    it "assigns a new budget_category as @budget_category" do
      get :new, {}, valid_session
      expect(assigns(:budget_category)).to be_a(BudgetCategory)
    end
  end

  describe "GET #edit" do
    it "assigns the requested budget_category as @budget_category" do
      budget_category = BudgetCategory.create! valid_attributes
      get :edit, {:id => budget_category.to_param}, valid_session
      expect(assigns(:budget_category)).to eq(budget_category)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new BudgetCategory" do
        expect {
          post :create, {:budget_category => valid_attributes}, valid_session
        }.to change(BudgetCategory, :count).by(1)
      end

      it "assigns a newly created budget_category as @budget_category" do
        post :create, {:budget_category => valid_attributes}, valid_session
        expect(assigns(:budget_category)).to be_a(BudgetCategory)
        expect(assigns(:budget_category)).to be_persisted
      end

      it "redirects to the created budget_category" do
        post :create, {:budget_category => valid_attributes}, valid_session
        expect(response).to redirect_to(BudgetCategory.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved budget_category as @budget_category" do
        post :create, {:budget_category => invalid_attributes}, valid_session
        expect(assigns(:budget_category)).to be_a_new(BudgetCategory)
      end

      it "re-renders the 'new' template" do
        post :create, {:budget_category => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested budget_category" do
        budget_category = BudgetCategory.create! valid_attributes
        put :update, {:id => budget_category.to_param, :budget_category => new_attributes}, valid_session
        budget_category.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested budget_category as @budget_category" do
        budget_category = BudgetCategory.create! valid_attributes
        put :update, {:id => budget_category.to_param, :budget_category => valid_attributes}, valid_session
        expect(assigns(:budget_category)).to eq(budget_category)
      end

      it "redirects to the budget_category" do
        budget_category = BudgetCategory.create! valid_attributes
        put :update, {:id => budget_category.to_param, :budget_category => valid_attributes}, valid_session
        expect(response).to redirect_to(budget_category)
      end
    end

    context "with invalid params" do
      it "assigns the budget_category as @budget_category" do
        budget_category = BudgetCategory.create! valid_attributes
        put :update, {:id => budget_category.to_param, :budget_category => invalid_attributes}, valid_session
        expect(assigns(:budget_category)).to eq(budget_category)
      end

      it "re-renders the 'edit' template" do
        budget_category = BudgetCategory.create! valid_attributes
        put :update, {:id => budget_category.to_param, :budget_category => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested budget_category" do
      budget_category = BudgetCategory.create! valid_attributes
      expect {
        delete :destroy, {:id => budget_category.to_param}, valid_session
      }.to change(BudgetCategory, :count).by(-1)
    end

    it "redirects to the budget_categories list" do
      budget_category = BudgetCategory.create! valid_attributes
      delete :destroy, {:id => budget_category.to_param}, valid_session
      expect(response).to redirect_to(budget_categories_url)
    end
  end

end
