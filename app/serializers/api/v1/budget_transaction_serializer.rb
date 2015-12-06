class Api::V1::BudgetTransactionSerializer < ActiveModel::Serializer
  ATTRS = [
    :amount,
    :comment,
    :kind,
    :account_name,
    :category_name,
    :user_email
  ]

  attributes *ATTRS

  def kind
    object.source_table.sub('budget_'.freeze, ''.freeze).singularize
  end

  def account_name
    object.budget_account.try(:name)
  end

  def category_name
    object.budget_category.try(:name)
  end

  def user_email
    object.user.try(:email)
  end
end
