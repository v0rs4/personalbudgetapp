RSpec.describe "budget_domains/show", type: :view do
  before(:each) do
    @budget_domain = assign(:budget_domain, budget_domain)
  end

  let(:budget_domain) { create(:budget_domain) }

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(Regexp.new(budget_domain.name))
    expect(rendered).to match(Regexp.new(budget_domain.description))
  end
end
