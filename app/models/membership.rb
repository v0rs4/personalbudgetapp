class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :budget_domain

  enum role: [:member, :manager, :admin]

  attr_accessor :email

  validates :email, format: { with: Devise.email_regexp }
end
