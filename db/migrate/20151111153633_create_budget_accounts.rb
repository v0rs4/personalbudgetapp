class CreateBudgetAccounts < ActiveRecord::Migration
  def change
    create_table :budget_accounts do |t|
      t.integer :budget_domain_id, null: false
      t.string :name, null: false
      t.text :description
      t.string :currency_code, null: false

      t.timestamps null: false
    end

    add_index :budget_accounts, [:budget_domain_id, :name], unique: true
    add_foreign_key :budget_accounts, :budget_domains
  end
end
