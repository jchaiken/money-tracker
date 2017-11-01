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

ActiveRecord::Schema.define(version: 20171029180045) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string   "name"
    t.string   "account_type"
    t.decimal  "balance"
    t.date     "due_date"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.decimal  "apr"
    t.decimal  "credit_limit"
    t.decimal  "minimum_payment"
    t.boolean  "paid",            default: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.decimal  "budget_amount"
  end

  create_table "notes", force: :cascade do |t|
    t.string   "explanation"
    t.decimal  "amount"
    t.date     "transaction_date"
    t.string   "transaction_type"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "account_id"
    t.integer  "related_account_id"
    t.integer  "category_id"
    t.index ["account_id"], name: "index_notes_on_account_id", using: :btree
    t.index ["category_id"], name: "index_notes_on_category_id", using: :btree
    t.index ["related_account_id"], name: "index_notes_on_related_account_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

end
