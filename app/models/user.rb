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

  has_many :memberships
  has_many :budget_domains, through: :memberships
end
