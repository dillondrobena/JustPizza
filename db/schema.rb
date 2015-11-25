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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20151118194046) do
=======
ActiveRecord::Schema.define(version: 20151125010748) do
>>>>>>> b84232ac419cc8b5781599cced5fd92f1fbcb32d

  create_table "crusts", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.boolean  "enabled",    default: true
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "user_id"
    t.float    "cost",       default: 0.0
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id"

  create_table "pizza_orders", force: :cascade do |t|
    t.integer "order_id"
    t.integer "quantity"
    t.integer "pizza_id"
    t.string  "pizza_type"
  end

  add_index "pizza_orders", ["order_id"], name: "index_pizza_orders_on_order_id"

  create_table "pizzas", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "crust_id"
  end

  add_index "pizzas", ["crust_id"], name: "index_pizzas_on_crust_id"

  create_table "pizzas_toppings", id: false, force: :cascade do |t|
    t.integer "pizza_id",   null: false
    t.integer "topping_id", null: false
  end

  create_table "specials", force: :cascade do |t|
    t.float    "cost"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "pizza_id"
<<<<<<< HEAD
    t.string   "pizza_path"
=======
    t.boolean  "enabled",    default: true
>>>>>>> b84232ac419cc8b5781599cced5fd92f1fbcb32d
  end

  create_table "toppings", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.float    "cost"
    t.boolean  "enabled",    default: true
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
