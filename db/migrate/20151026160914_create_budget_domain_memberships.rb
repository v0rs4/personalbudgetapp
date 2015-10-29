class CreateBudgetDomainMemberships < ActiveRecord::Migration
  def change
    create_table :budget_domain_memberships do |t|
      t.integer :user_id, null: false
      t.integer :budget_domain_id, null: false

      t.string :role, null: false, default: 'member'

      t.timestamps null: false
    end

    add_index :budget_domain_memberships, [:user_id, :budget_domain_id], unique: true
    add_foreign_key :budget_domain_memberships, :users
    add_foreign_key :budget_domain_memberships, :budget_domains
  end
end
