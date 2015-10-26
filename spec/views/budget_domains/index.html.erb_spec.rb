RSpec.describe "budget_domains/index", type: :view do
  before(:each) do
    assign(:budget_domains, [
      BudgetDomain.create!(
        :name => "Name",
        :description => "MyText"
      ),
      BudgetDomain.create!(
        :name => "Name",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of budget_domains" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
