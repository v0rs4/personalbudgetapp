RSpec.describe "budget_domains/index", type: :view do
  let!(:user) { create(:user_with_budget_domains, budget_domains_count: 2) }
  let(:budget_domains) { user.budget_domains }

  before(:each) do
    sign_in user
    assign(:budget_domains, budget_domains)
  end

  it "renders a list of budget_domains" do
    render
    budget_domains.each do |budget_domain|
      assert_select "tr>td", :text => budget_domain.name, :count => 1
      assert_select "tr>td", :text => budget_domain.description, :count => 1
    end
  end
end
