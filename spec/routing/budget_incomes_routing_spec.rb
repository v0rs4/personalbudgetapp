RSpec.describe BudgetIncomesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/budget/domains/1/incomes").to route_to("budget_incomes#index", :budget_domain_id => '1')
    end

    it "routes to #new" do
      expect(:get => "/budget/domains/1/incomes/new").to route_to("budget_incomes#new", :budget_domain_id => '1')
    end

    it "routes to #show" do
      expect(:get => "/budget/domains/1/incomes/1").to route_to("budget_incomes#show", :budget_domain_id => '1', :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/budget/domains/1/incomes/1/edit").to route_to("budget_incomes#edit", :budget_domain_id => '1', :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/budget/domains/1/incomes").to route_to("budget_incomes#create", :budget_domain_id => '1')
    end

    it "routes to #update via PUT" do
      expect(:put => "/budget/domains/1/incomes/1").to route_to("budget_incomes#update", :budget_domain_id => '1', :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/budget/domains/1/incomes/1").to route_to("budget_incomes#update", :budget_domain_id => '1', :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/budget/domains/1/incomes/1").to route_to("budget_incomes#destroy", :budget_domain_id => '1', :id => "1")
    end

  end
end
