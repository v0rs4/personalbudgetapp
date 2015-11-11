RSpec.describe BudgetCategoriesController, type: :controller do
  let!(:user) { create(:user_with_budget_domains) }
  let!(:budget_domain) { user.budget_domains.last }
  let!(:budget_category) { create(:budget_category, budget_domain_id: budget_domain.id) }

  before(:example) { sign_in user }

  let(:params) do
    {
      :id => budget_category.to_param
    }
  end

  let(:valid_attributes) do
    {
      name: FFaker::Lorem.word,
      kind: 'income'
    }
  end

  let(:invalid_attributes) do
    {
      name: nil,
      kind: 'income'
    }
  end

  describe "GET #index" do
    it "assigns all budget_categories as @budget_categories" do
      get :index, { budget_domain_id: budget_domain.id }
      expect(assigns(:budget_categories)).to eq([budget_category])
    end
  end

  describe "GET #show" do
    it "assigns the requested budget_category as @budget_category" do
      get :show, { budget_domain_id: budget_domain.to_param, id: budget_category.to_param }
      expect(assigns(:budget_category)).to eq(budget_category)
    end
  end

  describe "GET #new" do
    it "assigns a new budget_category as @budget_category" do
      get :new, { budget_domain_id: budget_domain.id }
      expect(assigns(:budget_category)).to be_a(BudgetCategory)
    end
  end

  describe "GET #edit" do
    it "assigns the requested budget_category as @budget_category" do
      get :edit, { budget_domain_id: budget_domain.to_param, id: budget_category.to_param }
      expect(assigns(:budget_category)).to eq(budget_category)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new BudgetCategory" do
        expect {
          post :create, {:budget_category => valid_attributes, budget_domain_id: budget_domain.to_param}
        }.to change(BudgetCategory, :count).by(1)
      end

      it "assigns a newly created budget_category as @budget_category" do
        post :create, {:budget_category => valid_attributes, budget_domain_id: budget_domain.to_param}
        expect(assigns(:budget_category)).to be_a(BudgetCategory)
        expect(assigns(:budget_category)).to be_persisted
      end

      it "redirects to the created budget_category" do
        post :create, {:budget_category => valid_attributes, budget_domain_id: budget_domain.to_param}
        expect(response).to redirect_to(budget_domain_budget_categories_path(budget_domain))
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved budget_category as @budget_category" do
        post :create, {:budget_category => invalid_attributes, budget_domain_id: budget_domain.to_param}
        expect(assigns(:budget_category)).to be_a_new(BudgetCategory)
      end

      it "re-renders the 'new' template" do
        post :create, {:budget_category => invalid_attributes, budget_domain_id: budget_domain.to_param}
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
        put :update, {:id => budget_category.to_param, :budget_category => new_attributes, budget_domain_id: budget_domain.to_param}
        budget_category.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested budget_category as @budget_category" do
        put :update, {:id => budget_category.to_param, :budget_category => valid_attributes, budget_domain_id: budget_domain.to_param}
        expect(assigns(:budget_category)).to eq(budget_category)
      end

      it "redirects to the budget_category" do
        put :update, {:id => budget_category.to_param, :budget_category => valid_attributes, budget_domain_id: budget_domain.to_param}
        expect(response).to redirect_to(budget_domain_budget_categories_path(budget_domain))
      end
    end

    context "with invalid params" do
      it "assigns the budget_category as @budget_category" do
        put :update, {:id => budget_category.to_param, :budget_category => invalid_attributes, budget_domain_id: budget_domain.to_param}
        expect(assigns(:budget_category)).to eq(budget_category)
      end

      it "re-renders the 'edit' template" do
        put :update, {:id => budget_category.to_param, :budget_category => invalid_attributes, budget_domain_id: budget_domain.to_param}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested budget_category" do
      expect {
        delete :destroy, {:id => budget_category.to_param, budget_domain_id: budget_domain.to_param}
      }.to change(BudgetCategory, :count).by(-1)
    end

    it "redirects to the budget_categories list" do
      delete :destroy, {:id => budget_category.to_param, budget_domain_id: budget_domain.to_param}
      expect(response).to redirect_to(budget_domain_budget_categories_path(budget_domain))
    end
  end

end
