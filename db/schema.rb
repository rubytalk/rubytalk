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

ActiveRecord::Schema.define(version: 20150224004101) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "failed_invitations", force: :cascade do |t|
    t.boolean  "solved",     default: false
    t.text     "reason"
    t.integer  "member_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "failed_invitations", ["member_id"], name: "index_failed_invitations_on_member_id", using: :btree

  create_table "members", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "email",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "members", ["email"], name: "index_members_on_email", unique: true, using: :btree

  add_foreign_key "failed_invitations", "members"
end
