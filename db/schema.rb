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

ActiveRecord::Schema.define(version: 20170203161303) do

  create_table "bank_accounts", force: :cascade do |t|
    t.string   "name"
    t.decimal  "balance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bills", force: :cascade do |t|
    t.string   "name"
    t.decimal  "balance"
    t.date     "due_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cash_accounts", force: :cascade do |t|
    t.string   "name"
    t.decimal  "balance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "credit_cards", force: :cascade do |t|
    t.string   "name"
    t.decimal  "balance"
    t.date     "due_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.string   "explanation"
    t.decimal  "amount"
    t.date     "transaction_date"
    t.string   "category"
    t.string   "transaction_type"
    t.integer  "bank_account_id"
    t.integer  "cash_account_id"
    t.integer  "credit_card_id"
    t.integer  "bill_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "transactions", ["bank_account_id"], name: "index_transactions_on_bank_account_id"
  add_index "transactions", ["bill_id"], name: "index_transactions_on_bill_id"
  add_index "transactions", ["cash_account_id"], name: "index_transactions_on_cash_account_id"
  add_index "transactions", ["credit_card_id"], name: "index_transactions_on_credit_card_id"

end
