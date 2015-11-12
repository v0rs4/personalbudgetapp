class CreateBudgetDebts < ActiveRecord::Migration
  def change
    create_table :budget_debts do |t|
      t.integer :user_id, null: false
      t.integer :budget_domain_id, null: false
      t.integer :budget_account_id, null: false
      t.decimal :amount, null: false
      t.string :comment

      t.timestamps null: false
    end

    add_foreign_key :budget_debts, :users
    add_foreign_key :budget_debts, :budget_domains
    add_foreign_key :budget_debts, :budget_accounts
  end
end
