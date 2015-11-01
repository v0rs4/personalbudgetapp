class BudgetDomainInvitation
  include ActiveModel::Model

  attr_accessor :email
  attr_accessor :budget_domain_id

  validates :email, format: { with: Devise.email_regexp }
  validates :budget_domain_id, numericality: { only_integer: true }
  validate :budget_domain_existence

  def send_invitation
    return false unless valid?

    @user = User.find_by_email(email)
    @budget_domain = BudgetDomain.find(budget_domain_id)

    _send_invitation if user && budget_domain && user_not_a_member?

    true
  end

  private

  attr_reader :user, :budget_domain

  def _send_invitation
    UserMailer.invite_to_budget_domain(
      user: user,
      budget_domain: budget_domain
    ).deliver_now
  end

  def user_not_a_member?
    !budget_domain.memberships.exists?(user_id: user.id)
  end

  def budget_domain_existence
    errors.add(:budget_domain_id, :invalid) unless budget_domain_exists?
  end

  def budget_domain_exists?
    BudgetDomain.exists?(id: budget_domain_id)
  end
end
