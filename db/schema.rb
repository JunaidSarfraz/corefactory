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

ActiveRecord::Schema.define(version: 20151101201647) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "_type"
    t.string   "bank_account_number"
    t.string   "bank_name"
    t.text     "bank_address"
    t.string   "bank_city"
    t.integer  "current_balance"
    t.integer  "user_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "branches", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "country"
    t.integer  "zip_code"
    t.string   "primary_phone"
    t.string   "secondary_phone"
    t.string   "email_address"
    t.integer  "factory_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "branch_head_id"
  end

  create_table "contract_payrolls", force: :cascade do |t|
    t.date     "contract_start_date"
    t.text     "description"
    t.integer  "_type"
    t.date     "fixed_contract_end_date"
    t.integer  "fixed_contract_amount_to_be_paid"
    t.integer  "payroll_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "contract_payrolls_pay_heads", force: :cascade do |t|
    t.integer  "pay_head_id"
    t.integer  "contract_payroll_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "pay"
    t.integer  "number_of_item"
  end

  create_table "factories", force: :cascade do |t|
    t.string   "name"
    t.text     "vision"
    t.text     "work_description"
    t.string   "email"
    t.string   "password_of_factory_email"
    t.string   "primary_phone"
    t.string   "secondary_phone"
    t.text     "tax_information"
    t.integer  "user_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "hobbies", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "pay_heads", force: :cascade do |t|
    t.string   "name"
    t.text     "work_description"
    t.integer  "pay"
    t.integer  "number_of_items"
    t.integer  "branch_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "payroll_schedules", force: :cascade do |t|
    t.date     "schedule_date"
    t.date     "pay_date"
    t.integer  "number_of_days_for_notification"
    t.integer  "payroll_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "payrolls", force: :cascade do |t|
    t.integer  "_type"
    t.integer  "amount"
    t.integer  "user_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "number_of_days_for_notification"
  end

  create_table "transections", force: :cascade do |t|
    t.integer  "payment_type"
    t.text     "description"
    t.integer  "submitted_account_id"
    t.integer  "withdrawn_account_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "payroll_schedule_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "cnic"
    t.string   "religion"
    t.integer  "gender"
    t.string   "cast"
    t.string   "height"
    t.string   "address"
    t.string   "city"
    t.string   "country"
    t.string   "primary_phone"
    t.string   "secondary_phone"
    t.date     "join_date"
    t.integer  "manager_id"
    t.integer  "branch_id"
    t.integer  "blood_group"
    t.boolean  "disabled",               default: true
    t.integer  "_type"
    t.integer  "zip_code",               default: 0
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "work_diaries", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "pay_head_id"
    t.integer  "number_of_items"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
