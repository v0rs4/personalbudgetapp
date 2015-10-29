RSpec.describe BudgetDomainInvitation do
  def expect_deliveries_change_by(qty)
    expect {
      yield
    }.to change(ActionMailer::Base.deliveries, :size).by(qty)
  end

  let!(:user) { create(:user) }
  let!(:budget_domain) { create(:budget_domain) }

  let(:email) { user.email }
  let(:budget_domain_id) { budget_domain.id }

  let(:attributes) do
    {
      email: email,
      budget_domain_id: budget_domain_id,
    }
  end

  let(:instance) { described_class.new(attributes) }

  describe '#send_invitation' do
    context 'when sends an invitation' do
      let(:mail) { ActionMailer::Base.deliveries.last }

      it 'should deliver an email' do
        expect_deliveries_change_by(1) { instance.send_invitation }
      end

      it 'should send a valid mail' do
        instance.send_invitation
        expect(mail.to).to include(user.email)
      end
    end

    context 'when does not send an invitation' do
      context 'when email is absent' do
        let(:email) { nil }

        it 'should not deliver an email' do
          expect_deliveries_change_by(0) { instance.send_invitation }
        end
      end

      context 'when budget_domain_id is absent' do
        let(:budget_domain_id) { nil }

        it 'should not deliver an email' do
          expect_deliveries_change_by(0) { instance.send_invitation }
        end
      end
    end
  end
end
