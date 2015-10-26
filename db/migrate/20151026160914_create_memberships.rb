class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.integer :user_id, null: false
      t.integer :budget_domain_id, null: false

      t.integer :role, null: false, default: 0

      t.timestamps null: false
    end

    add_index :memberships, [:user_id, :budget_domain_id], unique: true
    add_index :memberships, [:budget_domain_id, :user_id], unique: true
  end
end
