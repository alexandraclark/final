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

ActiveRecord::Schema.define(version: 0) do

  create_table "events", force: :cascade do |t|
    t.string  "title"
    t.integer "date"
    t.text    "details"
    t.string  "image_url"
    t.integer "budget"
  end

  create_table "guests", force: :cascade do |t|
    t.integer "user_id"
    t.string  "first_name"
    t.string  "last_name"
    t.string  "email"
    t.string  "phone"
  end

  add_index "guests", ["user_id"], name: "index_guests_on_user_id"

  create_table "invitations", force: :cascade do |t|
    t.integer "guest_id"
    t.integer "event_id"
    t.boolean "RSVP",      default: false
    t.boolean "attending", default: false
  end

  add_index "invitations", ["event_id"], name: "index_invitations_on_event_id"
  add_index "invitations", ["guest_id"], name: "index_invitations_on_guest_id"

  create_table "lists", force: :cascade do |t|
    t.string  "title"
    t.integer "event_id"
  end

  add_index "lists", ["event_id"], name: "index_lists_on_event_id"

  create_table "supplies", force: :cascade do |t|
    t.integer "event_id"
    t.string  "title"
    t.integer "quantity"
    t.integer "price"
    t.integer "user_id"
    t.string  "purchase_url"
    t.boolean "purchased",    default: false
  end

  add_index "supplies", ["event_id"], name: "index_supplies_on_event_id"
  add_index "supplies", ["user_id"], name: "index_supplies_on_user_id"

  create_table "tasks", force: :cascade do |t|
    t.integer "list_id"
    t.integer "due_date"
    t.string  "tag"
    t.integer "user_id"
    t.boolean "completed",      default: false
    t.integer "completed_date"
    t.string  "item"
  end

  add_index "tasks", ["list_id"], name: "index_tasks_on_list_id"
  add_index "tasks", ["user_id"], name: "index_tasks_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string  "username"
    t.string  "email"
    t.integer "guest_id"
    t.string  "password"
    t.string  "password_confirmation"
  end

  add_index "users", ["guest_id"], name: "index_users_on_guest_id"

end
