class CreateBudgetDomains < ActiveRecord::Migration
  def change
    create_table :budget_domains do |t|
      t.string :name, null: false
      t.text :description

      t.timestamps null: false
    end
  end
end
