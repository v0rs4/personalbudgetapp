class User < ActiveRecord::Base
  DEVISE_MODULES = [
    :database_authenticatable,
    :registerable,
    :recoverable,
    :rememberable,
    :trackable,
    :validatable
  ].freeze

  ROLES = [
    :user,
    :admin
  ].freeze

  devise  *DEVISE_MODULES

  enum role: ROLES

  has_many :budget_domain_memberships
  has_many :budget_domains, through: :budget_domain_memberships

  scope :with_membership, ->(budget_domain_id: nil) {
    rel = joins(:budget_domain_memberships).
      select(
        'users.*' \
        ', budget_domain_memberships.role as budget_domain_role' \
        ', budget_domain_memberships.id as budget_domain_id'
      )
    return rel unless budget_domain_id && budget_domain_id.is_a?(Fixnum)
    rel.where('budget_domain_id = ?', budget_domain_id)
  }
end
