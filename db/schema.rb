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

ActiveRecord::Schema.define(version: 20170111201753) do

  create_table "activity_logs", force: :cascade do |t|
    t.string   "user_id",    limit: 255
    t.string   "browser",    limit: 255
    t.string   "ip_address", limit: 255
    t.string   "controller", limit: 255
    t.string   "action",     limit: 255
    t.string   "params",     limit: 255
    t.string   "note",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "code",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "manufacturers", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "code",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "part_number",     limit: 255
    t.string   "name",            limit: 255
    t.string   "description",     limit: 255
    t.decimal  "price",                       precision: 10
    t.integer  "stock",           limit: 4
    t.integer  "manufacturer_id", limit: 4
    t.integer  "category_id",     limit: 4
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree
  add_index "products", ["manufacturer_id"], name: "index_products_on_manufacturer_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",        limit: 255
    t.string   "description",     limit: 255
    t.string   "password_digest", limit: 255
    t.boolean  "is_admin"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_foreign_key "products", "categories"
  add_foreign_key "products", "manufacturers"
end
