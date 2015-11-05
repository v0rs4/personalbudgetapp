class CreateBudgetCategories < ActiveRecord::Migration
  def change
    create_table :budget_categories do |t|
      t.integer :user_id, null: false, default: nil
      t.string :name, null: false, default: nil
      t.string :kind, null: false, default: nil

      t.timestamps null: false
    end

    add_index :budget_categories, [:user_id, :name], unique: true
    add_foreign_key :budget_categories, :users
  end
end
