RSpec.describe BudgetCategoriesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/budget/categories").to route_to("budget_categories#index")
    end

    it "routes to #new" do
      expect(:get => "/budget/categories/new").to route_to("budget_categories#new")
    end

    it "routes to #show" do
      expect(:get => "/budget/categories/1").to route_to("budget_categories#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/budget/categories/1/edit").to route_to("budget_categories#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/budget/categories").to route_to("budget_categories#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/budget/categories/1").to route_to("budget_categories#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/budget/categories/1").to route_to("budget_categories#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/budget/categories/1").to route_to("budget_categories#destroy", :id => "1")
    end

  end
end
