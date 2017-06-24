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

ActiveRecord::Schema.define(version: 20170624015424) do

  create_table "airports", force: :cascade do |t|
    t.string   "name"
    t.string   "id_code"
    t.string   "lease_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hangars", force: :cascade do |t|
    t.string   "type"
    t.string   "size"
    t.date     "last_payment"
    t.date     "first_payment"
    t.boolean  "leased"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "tennant"
    t.string   "tail_number"
    t.string   "hangar_number"
    t.string   "hangar_type"
  end

  create_table "leases", force: :cascade do |t|
    t.date     "lease_start"
    t.integer  "lease_term"
    t.date     "lease_end"
    t.boolean  "lease_signed"
    t.string   "signature"
    t.string   "additional_file"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "associated_user"
    t.integer  "associated_airport"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "admin"
    t.string   "first_name"
    t.string   "last_name"
    t.date     "signed_lease"
    t.date     "lease_expires"
    t.string   "company"
    t.integer  "airport_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
