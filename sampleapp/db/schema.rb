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

ActiveRecord::Schema.define(version: 20160210184357) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "emails", force: :cascade do |t|
    t.string   "server_name"
    t.string   "imap"
    t.integer  "imap_port"
    t.string   "smtp"
    t.integer  "smtp_port"
    t.string   "account_name"
    t.string   "account_password"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.float    "sending_time"
    t.float    "receiving_time"
  end

  create_table "emails_summaries", force: :cascade do |t|
    t.integer "email_id"
    t.integer "summary_id"
  end

  create_table "sites", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "ping"
    t.string   "ip"
  end

  create_table "sites_summaries", force: :cascade do |t|
    t.integer "site_id"
    t.integer "summary_id"
  end

  create_table "sites_users", force: :cascade do |t|
    t.integer "site_id"
    t.integer "user_id"
  end

  create_table "summaries", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "summaries_users", force: :cascade do |t|
    t.integer "summary_id"
    t.integer "user_id"
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

end
