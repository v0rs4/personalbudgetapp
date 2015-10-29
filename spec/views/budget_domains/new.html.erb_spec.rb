RSpec.describe "budget_domains/new", type: :view do
  let!(:user) { create(:user) }

  before(:each) do
    sign_in user
    assign(:budget_domain, BudgetDomain.new(
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders new budget_domain form" do
    render
    assert_select "form[action=?][method=?]", budget_domains_path, "post" do
      assert_select "input#budget_domain_name[name=?]", "budget_domain[name]"
      assert_select "textarea#budget_domain_description[name=?]", "budget_domain[description]"
    end
  end
end
