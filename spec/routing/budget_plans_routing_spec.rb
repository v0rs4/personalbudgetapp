RSpec.describe BudgetPlansController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/budget/domains/1/plans").to route_to("budget_plans#index", budget_domain_id: "1")
    end

    it "routes to #new" do
      expect(:get => "/budget/domains/1/plans/new").to route_to("budget_plans#new", budget_domain_id: "1")
    end

    it "routes to #show" do
      expect(:get => "/budget/domains/1/plans/1").to route_to("budget_plans#show", budget_domain_id: "1", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/budget/domains/1/plans/1/edit").to route_to("budget_plans#edit", budget_domain_id: "1", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/budget/domains/1/plans").to route_to("budget_plans#create", budget_domain_id: "1")
    end

    it "routes to #update via PUT" do
      expect(:put => "/budget/domains/1/plans/1").to route_to("budget_plans#update", budget_domain_id: "1", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/budget/domains/1/plans/1").to route_to("budget_plans#update", budget_domain_id: "1", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/budget/domains/1/plans/1").to route_to("budget_plans#destroy", budget_domain_id: "1", :id => "1")
    end
  end
end
