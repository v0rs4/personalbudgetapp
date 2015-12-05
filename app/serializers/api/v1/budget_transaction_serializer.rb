class Api::V1::BudgetTransactionSerializer < ActiveModel::Serializer
  attributes :amount, :comment, :kind, :account_name

  def kind
    object.source_table.sub('budget_'.freeze, ''.freeze).singularize
  end

  def account_name
    object.budget_account.try(:name)
  end
end
