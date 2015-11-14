class Ability
  include CanCan::Ability

  private

  attr_reader :user

  def initialize(user)
    @user = user
    set_budget_domain_abilities
    set_budget_category_abilities
    set_budget_account_abilities
    set_budget_debt_abilities
    set_budget_expense_abilities
    set_budget_income_abilities
    set_budget_plan_abilities
  end

  def set_budget_domain_abilities
    can :read, BudgetDomain, user.budget_domains do |budget_domain|
      budget_domain.memberships.any? { |x| x.user_id == user.id }
    end
    can :create, BudgetDomain
    can [:update, :destroy], BudgetDomain do |budget_domain|
      budget_domain.memberships.any? { |x| x.user_id == user.id && x.admin? }
    end
  end

  def set_budget_category_abilities
    can :read, BudgetCategory, :budget_domain => { :budget_domain_memberships => { user_id: user.id } }
    can [:create, :update, :destroy], BudgetCategory, :budget_domain => { :budget_domain_memberships => { user_id: user.id, role: 'admin' } }
  end

  def set_budget_account_abilities
    can :read, BudgetAccount, :budget_domain => { :budget_domain_memberships => { user_id: user.id } }
    can [:create, :update, :destroy], BudgetAccount, :budget_domain => { :budget_domain_memberships => { user_id: user.id, role: 'admin' } }
  end

  def set_budget_debt_abilities
    can [:create, :read], BudgetDebt, :budget_domain => { :budget_domain_memberships => { user_id: user.id } }
    can [:update, :destroy], BudgetDebt, :budget_domain => { :budget_domain_memberships => { user_id: user.id, role: 'admin' } }
    can [:update, :destroy], BudgetDebt, :user_id => user.id
  end

  def set_budget_expense_abilities
    can [:create, :read], BudgetExpense, :budget_domain => { :budget_domain_memberships => { user_id: user.id } }
    can [:update, :destroy], BudgetExpense, :user_id => user.id
    can [:update, :destroy], BudgetExpense, :budget_domain => { :budget_domain_memberships => { user_id: user.id, role: 'admin' } }
  end

  def set_budget_income_abilities
    can [:read, :create], BudgetIncome, :budget_domain => { :budget_domain_memberships => { user_id: user.id } }
    can [:update, :destroy], BudgetIncome, :user_id => user.id
    can [:update, :destroy], BudgetIncome, :budget_domain => { :budget_domain_memberships => { user_id: user.id, role: 'admin' } }
  end

  def set_budget_plan_abilities
    can [:read], BudgetPlan, :budget_domain => { :budget_domain_memberships => { user_id: user.id } }
    can [:create, :update, :destroy], BudgetPlan, :budget_domain => { :budget_domain_memberships => { user_id: user.id, role: 'admin' } }
  end
end
