RSpec.describe "budget_domains/show", type: :view do
  let!(:user) { create(:user_with_budget_domains) }
  let(:budget_domain) { user.budget_domains.last }
  let(:members) { User.with_membership(budget_domain_id: budget_domain.id) }

  before(:each) do
    sign_in user
    assign(:budget_domain, budget_domain)
    assign(:members, members)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(Regexp.new(budget_domain.name))
    expect(rendered).to match(Regexp.new(budget_domain.description))
  end
end
