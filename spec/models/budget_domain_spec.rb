RSpec.describe BudgetDomain, type: :model do
  it { is_expected.to have_db_column(:name).of_type(:string).with_options(null: false) }
  it { is_expected.to have_db_column(:description).of_type(:text) }

  it { is_expected.to have_many(:users) }
  it { is_expected.to have_many(:budget_domain_memberships) }
end
