# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151112085129) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "budget_accounts", force: :cascade do |t|
    t.integer  "budget_domain_id", null: false
    t.string   "name",             null: false
    t.text     "description"
    t.string   "currency_code",    null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "budget_accounts", ["budget_domain_id", "name"], name: "index_budget_accounts_on_budget_domain_id_and_name", unique: true, using: :btree

  create_table "budget_categories", force: :cascade do |t|
    t.integer  "budget_domain_id", null: false
    t.string   "name",             null: false
    t.string   "kind",             null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "budget_categories", ["budget_domain_id", "name"], name: "index_budget_categories_on_budget_domain_id_and_name", unique: true, using: :btree

  create_table "budget_debts", force: :cascade do |t|
    t.integer  "user_id",           null: false
    t.integer  "budget_domain_id",  null: false
    t.integer  "budget_account_id", null: false
    t.decimal  "amount",            null: false
    t.string   "comment"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "budget_domain_memberships", force: :cascade do |t|
    t.integer  "user_id",                             null: false
    t.integer  "budget_domain_id",                    null: false
    t.string   "role",             default: "member", null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "budget_domain_memberships", ["user_id", "budget_domain_id"], name: "index_budget_domain_memberships_on_user_id_and_budget_domain_id", unique: true, using: :btree

  create_table "budget_domains", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "budget_expenses", force: :cascade do |t|
    t.integer  "user_id",            null: false
    t.integer  "budget_domain_id",   null: false
    t.integer  "budget_account_id",  null: false
    t.decimal  "amount",             null: false
    t.integer  "budget_category_id", null: false
    t.string   "comment"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "budget_incomes", force: :cascade do |t|
    t.integer  "user_id",            null: false
    t.integer  "budget_domain_id",   null: false
    t.integer  "budget_account_id",  null: false
    t.integer  "budget_category_id", null: false
    t.decimal  "amount",             null: false
    t.string   "comment"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "budget_plans", force: :cascade do |t|
    t.integer  "budget_domain_id",                 null: false
    t.integer  "budget_category_id",               null: false
    t.decimal  "planned_amount",                   null: false
    t.decimal  "actual_amount",      default: 0.0, null: false
    t.integer  "year",                             null: false
    t.integer  "month",                            null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "budget_plans", ["budget_domain_id", "budget_category_id", "month"], name: "budget_plans_uniq_record", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.integer  "role",                   default: 0,  null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "budget_accounts", "budget_domains"
  add_foreign_key "budget_categories", "budget_domains"
  add_foreign_key "budget_debts", "budget_accounts"
  add_foreign_key "budget_debts", "budget_domains"
  add_foreign_key "budget_debts", "users"
  add_foreign_key "budget_domain_memberships", "budget_domains"
  add_foreign_key "budget_domain_memberships", "users"
  add_foreign_key "budget_expenses", "budget_accounts"
  add_foreign_key "budget_expenses", "budget_categories"
  add_foreign_key "budget_expenses", "budget_domains"
  add_foreign_key "budget_expenses", "users"
  add_foreign_key "budget_incomes", "budget_accounts"
  add_foreign_key "budget_incomes", "budget_categories"
  add_foreign_key "budget_incomes", "budget_domains"
  add_foreign_key "budget_incomes", "users"
  add_foreign_key "budget_plans", "budget_categories"
  add_foreign_key "budget_plans", "budget_domains"
end
