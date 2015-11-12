RSpec.describe BudgetDebtsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/budget/domains/1/debts").to route_to("budget_debts#index", :budget_domain_id => '1')
    end

    it "routes to #new" do
      expect(:get => "/budget/domains/1/debts/new").to route_to("budget_debts#new", :budget_domain_id => '1')
    end

    it "routes to #show" do
      expect(:get => "/budget/domains/1/debts/1").to route_to("budget_debts#show", :budget_domain_id => '1', :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/budget/domains/1/debts/1/edit").to route_to("budget_debts#edit", :budget_domain_id => '1', :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/budget/domains/1/debts").to route_to("budget_debts#create", :budget_domain_id => '1')
    end

    it "routes to #update via PUT" do
      expect(:put => "/budget/domains/1/debts/1").to route_to("budget_debts#update", :budget_domain_id => '1', :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/budget/domains/1/debts/1").to route_to("budget_debts#update", :budget_domain_id => '1', :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/budget/domains/1/debts/1").to route_to("budget_debts#destroy", :budget_domain_id => '1', :id => "1")
    end

  end
end
