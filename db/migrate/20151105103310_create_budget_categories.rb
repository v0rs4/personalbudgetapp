class CreateBudgetCategories < ActiveRecord::Migration
  def change
    create_table :budget_categories do |t|
      t.integer :budget_domain_id, null: false
      t.string :name, null: false
      t.string :kind, null: false

      t.timestamps null: false
    end

    add_index :budget_categories, [:budget_domain_id, :name], unique: true
    add_foreign_key :budget_categories, :budget_domains
  end
end
