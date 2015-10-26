RSpec.describe User, type: :model do
  it do
    is_expected.to have_db_column(:role).
      of_type(:integer).
      with_options(default: 0, null: false)
  end

  it do
    is_expected.to have_db_column(:email).
      of_type(:string).
      with_options(null: false, default: "")
  end

  it do
    is_expected.to have_db_column(:encrypted_password).
      of_type(:string).
      with_options(null: false, default: "")
  end

  it { is_expected.to have_db_column(:reset_password_token) }
  it { is_expected.to have_db_column(:reset_password_sent_at) }
  it { is_expected.to have_db_column(:remember_created_at) }
  it { is_expected.to have_db_column(:created_at) }
  it { is_expected.to have_db_column(:updated_at) }

  it { is_expected.to have_many(:budget_domains) }
  it { is_expected.to have_many(:memberships) }
end
