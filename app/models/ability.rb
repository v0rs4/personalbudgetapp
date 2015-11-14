class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, BudgetDomain, user.budget_domains do |budget_domain|
      budget_domain.memberships.any? { |x| x.user_id == user.id }
    end

    can :read, BudgetCategory, :budget_domain => { :budget_domain_memberships => { user_id: user.id } }

    can [:update, :destroy, :create], BudgetDomain do |budget_domain|
      budget_domain.memberships.any? { |x| x.user_id == user.id && x.admin? }
    end
  end
end
