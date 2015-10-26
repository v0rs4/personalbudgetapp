RSpec.describe "budget_domains/edit", type: :view do
  before(:each) do
    @budget_domain = assign(:budget_domain, BudgetDomain.create!(
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit budget_domain form" do
    render

    assert_select "form[action=?][method=?]", budget_domain_path(@budget_domain), "post" do

      assert_select "input#budget_domain_name[name=?]", "budget_domain[name]"

      assert_select "textarea#budget_domain_description[name=?]", "budget_domain[description]"
    end
  end
end
