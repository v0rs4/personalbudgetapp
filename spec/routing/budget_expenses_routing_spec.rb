require "rails_helper"

RSpec.describe BudgetExpensesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/budget_expenses").to route_to("budget_expenses#index")
    end

    it "routes to #new" do
      expect(:get => "/budget_expenses/new").to route_to("budget_expenses#new")
    end

    it "routes to #show" do
      expect(:get => "/budget_expenses/1").to route_to("budget_expenses#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/budget_expenses/1/edit").to route_to("budget_expenses#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/budget_expenses").to route_to("budget_expenses#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/budget_expenses/1").to route_to("budget_expenses#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/budget_expenses/1").to route_to("budget_expenses#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/budget_expenses/1").to route_to("budget_expenses#destroy", :id => "1")
    end

  end
end
