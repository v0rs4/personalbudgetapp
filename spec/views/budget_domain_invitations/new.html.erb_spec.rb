RSpec.describe "budget_domain_invitations/new.html.erb", type: :view do
  let!(:user) { create(:user_with_budget_domains) }

  let(:email) { FFaker::Internet.email }
  let(:budget_domain) { user.budget_domains.last }

  before(:example) do
    sign_in user
    view.params[:budget_domain_id] = budget_domain.id
    assign(:budget_domain, budget_domain)
    assign(:budget_domain_invitation, BudgetDomainInvitation.new(
      email: email,
      budget_domain_id: budget_domain.id
    ))
  end

  it "renders new budget_domain form" do
    render

    assert_select "form[action=?][method=?]", budget_domain_invitations_path(budget_domain), "post" do
      assert_select "input#budget_domain_invitation_email[name=?]", "budget_domain_invitation[email]"
    end
  end
end
