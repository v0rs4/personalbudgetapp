class CreateBudgetPlans < ActiveRecord::Migration
  def change
    create_table :budget_plans do |t|
      t.integer :budget_domain_id, null: false
      t.integer :budget_category_id, null: false
      t.decimal :planned_amount, null: false
      t.decimal :actual_amount, null: false, default: 0
      t.integer :year, null: false
      t.integer :month, null: false

      t.timestamps null: false
    end

    add_index :budget_plans, [
      :budget_domain_id,
      :budget_category_id,
      :month], unique: true, name: :budget_plans_uniq_record

    add_foreign_key :budget_plans, :budget_domains
    add_foreign_key :budget_plans, :budget_categories
  end
end
