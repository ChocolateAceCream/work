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

ActiveRecord::Schema.define(version: 20160201151907) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.integer  "number"
    t.string   "name"
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.integer  "mtd_sales"
    t.string   "ytd_sales"
    t.integer  "current_balance"
    t.integer  "credit_limit"
    t.string   "ship_to_addr"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "salesrepnumber"
  end

  create_table "microposts", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "picture"
  end

  add_index "microposts", ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at", using: :btree
  add_index "microposts", ["user_id"], name: "index_microposts_on_user_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "order_number"
    t.date     "date"
    t.integer  "part_number"
    t.integer  "qutity"
    t.integer  "price"
    t.string   "customer"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "parts", force: :cascade do |t|
    t.integer  "number"
    t.text     "description"
    t.integer  "price"
    t.integer  "mtd_sales"
    t.integer  "ytd_sales"
    t.integer  "units_on_hand"
    t.integer  "units_allocated"
    t.integer  "reorder_point"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "relation_terri_sales_reps", force: :cascade do |t|
    t.integer  "territory_id"
    t.integer  "sales_rep_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "salesreps", force: :cascade do |t|
    t.integer  "sales_rep_number"
    t.string   "sales_rep_name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "mtd_sales"
    t.string   "ytd_sales"
    t.string   "mtd_commission"
    t.string   "ytd_commission"
    t.string   "commission_rate"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "territorynumber"
  end

  create_table "sites", force: :cascade do |t|
    t.string   "name"
    t.integer  "ping"
    t.datetime "last_update"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "summaries", force: :cascade do |t|
    t.string   "name"
    t.integer  "site_number"
    t.text     "summary_description"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "territories", force: :cascade do |t|
    t.integer  "number"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",             default: false
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  create_table "vendors", force: :cascade do |t|
    t.integer  "vendor_number"
    t.string   "vendor_name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.integer  "vendor_part_number"
    t.integer  "part_charges"
    t.integer  "minimum_order"
    t.date     "deliver_date"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_foreign_key "microposts", "users"
end
