class CreateBudgetIncomes < ActiveRecord::Migration
  def change
    create_table :budget_incomes do |t|
      t.integer :user_id, null: false
      t.integer :budget_domain_id, null: false
      t.integer :budget_account_id, null: false
      t.integer :budget_category_id, null: false
      t.decimal :amount, null: false
      t.string :comment

      t.timestamps null: false
    end

    add_foreign_key :budget_incomes, :users
    add_foreign_key :budget_incomes, :budget_domains
    add_foreign_key :budget_incomes, :budget_accounts
    add_foreign_key :budget_incomes, :budget_categories
  end
end
