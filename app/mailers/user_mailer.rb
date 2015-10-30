class UserMailer < ApplicationMailer
  def invite_to_budget_domain(user:, budget_domain:)
    @user, @budget_domain = user, budget_domain
    @jwt = JWTEncoder.call(
      data: {
        user_id: user.id,
        budget_domain_id: budget_domain.id
      }
    ).result[:token]

    mail to: user.email, subject: "[PersonalBudger] an invitation to join '#{budget_domain.name}' budget domain"
  end
end
