class Api::V1::BudgetExpenseSerializer < ActiveModel::Serializer
  attributes :amount, :comment, :permissions

  def permissions
    {
      can_create: scope.can?(:create, object),
      can_read: scope.can?(:read, object),
      can_update: scope.can?(:update, object),
      can_destroy: scope.can?(:destroy, object)
    }
  end
end
