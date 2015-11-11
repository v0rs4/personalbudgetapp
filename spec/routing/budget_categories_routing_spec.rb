RSpec.describe BudgetCategoriesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/budget/domains/1/categories").to route_to("budget_categories#index", budget_domain_id: "1")
    end

    it "routes to #new" do
      expect(:get => "/budget/domains/1/categories/new").to route_to("budget_categories#new", budget_domain_id: "1")
    end

    it "routes to #show" do
      expect(:get => "/budget/domains/1/categories/1").to route_to("budget_categories#show", budget_domain_id: "1", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/budget/domains/1/categories/1/edit").to route_to("budget_categories#edit", budget_domain_id: "1", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/budget/domains/1/categories").to route_to("budget_categories#create", budget_domain_id: "1")
    end

    it "routes to #update via PUT" do
      expect(:put => "/budget/domains/1/categories/1").to route_to("budget_categories#update", budget_domain_id: "1", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/budget/domains/1/categories/1").to route_to("budget_categories#update", budget_domain_id: "1", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/budget/domains/1/categories/1").to route_to("budget_categories#destroy", budget_domain_id: "1", :id => "1")
    end

  end
end
