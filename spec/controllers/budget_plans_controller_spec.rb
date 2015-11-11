# RSpec.describe BudgetPlansController, type: :controller do
#   # This should return the minimal set of attributes required to create a valid
#   # BudgetPlan. As you add validations to BudgetPlan, be sure to
#   # adjust the attributes here as well.
#   let(:valid_attributes) {
#     skip("Add a hash of attributes valid for your model")
#   }

#   let(:invalid_attributes) {
#     skip("Add a hash of attributes invalid for your model")
#   }

#   # This should return the minimal set of values that should be in the session
#   # in order to pass any filters (e.g. authentication) defined in
#   # BudgetPlansController. Be sure to keep this updated too.
#   let(:valid_session) { {} }

#   describe "GET #index" do
#     it "assigns all budget_plans as @budget_plans" do
#       budget_plan = BudgetPlan.create! valid_attributes
#       get :index, {}, valid_session
#       expect(assigns(:budget_plans)).to eq([budget_plan])
#     end
#   end

#   describe "GET #show" do
#     it "assigns the requested budget_plan as @budget_plan" do
#       budget_plan = BudgetPlan.create! valid_attributes
#       get :show, {:id => budget_plan.to_param}, valid_session
#       expect(assigns(:budget_plan)).to eq(budget_plan)
#     end
#   end

#   describe "GET #new" do
#     it "assigns a new budget_plan as @budget_plan" do
#       get :new, {}, valid_session
#       expect(assigns(:budget_plan)).to be_a_new(BudgetPlan)
#     end
#   end

#   describe "GET #edit" do
#     it "assigns the requested budget_plan as @budget_plan" do
#       budget_plan = BudgetPlan.create! valid_attributes
#       get :edit, {:id => budget_plan.to_param}, valid_session
#       expect(assigns(:budget_plan)).to eq(budget_plan)
#     end
#   end

#   describe "POST #create" do
#     context "with valid params" do
#       it "creates a new BudgetPlan" do
#         expect {
#           post :create, {:budget_plan => valid_attributes}, valid_session
#         }.to change(BudgetPlan, :count).by(1)
#       end

#       it "assigns a newly created budget_plan as @budget_plan" do
#         post :create, {:budget_plan => valid_attributes}, valid_session
#         expect(assigns(:budget_plan)).to be_a(BudgetPlan)
#         expect(assigns(:budget_plan)).to be_persisted
#       end

#       it "redirects to the created budget_plan" do
#         post :create, {:budget_plan => valid_attributes}, valid_session
#         expect(response).to redirect_to(BudgetPlan.last)
#       end
#     end

#     context "with invalid params" do
#       it "assigns a newly created but unsaved budget_plan as @budget_plan" do
#         post :create, {:budget_plan => invalid_attributes}, valid_session
#         expect(assigns(:budget_plan)).to be_a_new(BudgetPlan)
#       end

#       it "re-renders the 'new' template" do
#         post :create, {:budget_plan => invalid_attributes}, valid_session
#         expect(response).to render_template("new")
#       end
#     end
#   end

#   describe "PUT #update" do
#     context "with valid params" do
#       let(:new_attributes) {
#         skip("Add a hash of attributes valid for your model")
#       }

#       it "updates the requested budget_plan" do
#         budget_plan = BudgetPlan.create! valid_attributes
#         put :update, {:id => budget_plan.to_param, :budget_plan => new_attributes}, valid_session
#         budget_plan.reload
#         skip("Add assertions for updated state")
#       end

#       it "assigns the requested budget_plan as @budget_plan" do
#         budget_plan = BudgetPlan.create! valid_attributes
#         put :update, {:id => budget_plan.to_param, :budget_plan => valid_attributes}, valid_session
#         expect(assigns(:budget_plan)).to eq(budget_plan)
#       end

#       it "redirects to the budget_plan" do
#         budget_plan = BudgetPlan.create! valid_attributes
#         put :update, {:id => budget_plan.to_param, :budget_plan => valid_attributes}, valid_session
#         expect(response).to redirect_to(budget_plan)
#       end
#     end

#     context "with invalid params" do
#       it "assigns the budget_plan as @budget_plan" do
#         budget_plan = BudgetPlan.create! valid_attributes
#         put :update, {:id => budget_plan.to_param, :budget_plan => invalid_attributes}, valid_session
#         expect(assigns(:budget_plan)).to eq(budget_plan)
#       end

#       it "re-renders the 'edit' template" do
#         budget_plan = BudgetPlan.create! valid_attributes
#         put :update, {:id => budget_plan.to_param, :budget_plan => invalid_attributes}, valid_session
#         expect(response).to render_template("edit")
#       end
#     end
#   end

#   describe "DELETE #destroy" do
#     it "destroys the requested budget_plan" do
#       budget_plan = BudgetPlan.create! valid_attributes
#       expect {
#         delete :destroy, {:id => budget_plan.to_param}, valid_session
#       }.to change(BudgetPlan, :count).by(-1)
#     end

#     it "redirects to the budget_plans list" do
#       budget_plan = BudgetPlan.create! valid_attributes
#       delete :destroy, {:id => budget_plan.to_param}, valid_session
#       expect(response).to redirect_to(budget_plans_path)
#     end
#   end
# end
