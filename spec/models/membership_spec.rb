RSpec.describe Membership, type: :model do
  it { is_expected.to have_db_column(:user_id).of_type(:integer).with_options(null: false) }
  it { is_expected.to have_db_column(:budget_domain_id).of_type(:integer).with_options(null: false) }
  it { is_expected.to have_db_column(:role).of_type(:integer).with_options(null: false, default: 0) }

  it { is_expected.to have_db_index([:user_id, :budget_domain_id]).unique(true) }
  it { is_expected.to have_db_index([:budget_domain_id, :user_id]).unique(true) }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:budget_domain) }
end
