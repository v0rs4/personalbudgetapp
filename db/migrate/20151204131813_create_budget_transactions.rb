class CreateBudgetTransactions < ActiveRecord::Migration
  def change
    create_table :budget_transactions do |t|
      t.integer :user_id
      t.integer :budget_domain_id
      t.integer :budget_account_id
      t.integer :budget_category_id
      t.decimal :amount
      t.string :comment
      t.integer :source_id
      t.string :source_table

      t.timestamps null: false
    end

    add_index :budget_transactions, :user_id
    add_index :budget_transactions, :budget_domain_id

    reversible do |dir|
      dir.up { create_triggers }
      dir.down { drop_triggers }
    end
  end

  def create_triggers
    execute <<-SQL
      CREATE OR REPLACE FUNCTION trg_func_insert_into_budget_transaction()
        RETURNS TRIGGER
        SECURITY DEFINER
        LANGUAGE PLPGSQL
      AS $$
        DECLARE
          src_tbl varchar(20);
        BEGIN
          src_tbl := TG_ARGV[0]::varchar(20);
          CASE src_tbl
            WHEN 'budget_expenses', 'budget_incomes' THEN
              INSERT INTO budget_transactions(user_id, budget_domain_id, budget_account_id, budget_category_id, amount, comment,source_id, source_table, created_at, updated_at)
                VALUES (NEW.user_id, NEW.budget_domain_id, NEW.budget_account_id, NEW.budget_category_id, NEW.amount, NEW.comment, NEW.id, src_tbl, NEW.created_at, NEW.updated_at);
            WHEN 'budget_debts' THEN
              INSERT INTO budget_transactions(user_id, budget_domain_id, budget_account_id, amount, comment,source_id, source_table, created_at, updated_at)
                VALUES (NEW.user_id, NEW.budget_domain_id, NEW.budget_account_id, NEW.amount, NEW.comment, NEW.id, src_tbl, NEW.created_at, NEW.updated_at);
          END CASE;
          RETURN NEW;
        END;
      $$;

      CREATE OR REPLACE FUNCTION trg_func_update_budget_transaction()
        RETURNS TRIGGER
        SECURITY DEFINER
        LANGUAGE PLPGSQL
      AS $$
        DECLARE
          src_tbl varchar(20);
        BEGIN
          src_tbl := TG_ARGV[0]::varchar(20);
          CASE src_tbl
            WHEN 'budget_expenses', 'budget_incomes' THEN
              UPDATE budget_transactions
                  SET user_id = NEW.user_id, budget_domain_id = NEW.budget_domain_id, budget_account_id = NEW.budget_account_id, budget_category_id = NEW.budget_category_id, amount = NEW.amount, comment = NEW.comment, created_at = NEW.created_at, updated_at = NEW.updated_at
              WHERE source_id = NEW.id AND source_table = src_tbl;
            WHEN 'budget_debts' THEN
              UPDATE budget_transactions
                  SET user_id = NEW.user_id, budget_domain_id = NEW.budget_domain_id, budget_account_id = NEW.budget_account_id, amount = NEW.amount, comment = NEW.comment, created_at = NEW.created_at, updated_at = NEW.updated_at
              WHERE source_id = NEW.id AND source_table = src_tbl;
          END CASE;
          RETURN NEW;
        END;
      $$;

      CREATE OR REPLACE FUNCTION trg_func_delete_budget_transaction()
        RETURNS TRIGGER
        SECURITY DEFINER
        LANGUAGE PLPGSQL
      AS $$
        BEGIN
            DELETE FROM budget_transactions WHERE source_id = OLD.id AND source_table = TG_ARGV[0]::varchar(20);
            RETURN OLD;
        END;
      $$;

      CREATE TRIGGER after_insert_to_budget_expenses__insert_to_budget_transactions AFTER INSERT ON budget_expenses
        FOR EACH ROW EXECUTE PROCEDURE trg_func_insert_into_budget_transaction('budget_expenses');

      CREATE TRIGGER after_insert_to_budget_incomes__insert_to_budget_transactions AFTER INSERT ON budget_incomes
        FOR EACH ROW EXECUTE PROCEDURE trg_func_insert_into_budget_transaction('budget_incomes');

      CREATE TRIGGER after_insert_to_budget_debts__insert_to_budget_transactions AFTER INSERT ON budget_debts
        FOR EACH ROW EXECUTE PROCEDURE trg_func_insert_into_budget_transaction('budget_debts');

      CREATE TRIGGER after_update_budget_expenses__update_budget_transaction AFTER UPDATE ON budget_expenses
        FOR EACH ROW EXECUTE PROCEDURE trg_func_update_budget_transaction('budget_expenses');

      CREATE TRIGGER after_update_budget_incomes__update_budget_transaction AFTER UPDATE ON budget_incomes
        FOR EACH ROW EXECUTE PROCEDURE trg_func_update_budget_transaction('budget_incomes');

      CREATE TRIGGER after_update_budget_debts__update_budget_transaction AFTER UPDATE ON budget_debts
        FOR EACH ROW EXECUTE PROCEDURE trg_func_update_budget_transaction('budget_debts');

      CREATE TRIGGER after_delete_budget_expenses__delete_budget_transaction AFTER DELETE ON budget_expenses
        FOR EACH ROW EXECUTE PROCEDURE trg_func_delete_budget_transaction('budget_expenses');

      CREATE TRIGGER after_delete_budget_incomes__delete_budget_transaction AFTER DELETE ON budget_incomes
        FOR EACH ROW EXECUTE PROCEDURE trg_func_delete_budget_transaction('budget_incomes');

      CREATE TRIGGER after_delete_budget_debts__delete_budget_transaction AFTER DELETE ON budget_debts
        FOR EACH ROW EXECUTE PROCEDURE trg_func_delete_budget_transaction('budget_debts');
    SQL
  end

  def drop_triggers
    execute <<-SQL
      DROP TRIGGER after_insert_to_budget_expenses__insert_to_budget_transactions ON budget_expenses;
      DROP TRIGGER after_insert_to_budget_incomes__insert_to_budget_transactions ON budget_incomes;
      DROP TRIGGER after_insert_to_budget_debts__insert_to_budget_transactions ON budget_debts;
      DROP TRIGGER after_update_budget_expenses__update_budget_transaction ON budget_expenses;
      DROP TRIGGER after_update_budget_incomes__update_budget_transaction ON budget_incomes;
      DROP TRIGGER after_update_budget_debts__update_budget_transaction ON budget_debts;
      DROP TRIGGER after_delete_budget_expenses__delete_budget_transaction ON budget_expenses;
      DROP TRIGGER after_delete_budget_incomes__delete_budget_transaction ON budget_incomes;
      DROP TRIGGER after_delete_budget_debts__delete_budget_transaction ON budget_debts;

      DROP FUNCTION trg_func_insert_into_budget_transaction();
      DROP FUNCTION trg_func_update_budget_transaction();
      DROP FUNCTION trg_func_delete_budget_transaction();
    SQL
  end
end
