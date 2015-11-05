RSpec.describe BudgetDomainsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/budget/domains").to route_to("budget_domains#index")
    end

    it "routes to #new" do
      expect(:get => "/budget/domains/new").to route_to("budget_domains#new")
    end

    it "routes to #show" do
      expect(:get => "/budget/domains/1").to route_to("budget_domains#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/budget/domains/1/edit").to route_to("budget_domains#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/budget/domains").to route_to("budget_domains#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/budget/domains/1").to route_to("budget_domains#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/budget/domains/1").to route_to("budget_domains#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/budget/domains/1").to route_to("budget_domains#destroy", :id => "1")
    end
  end
end
