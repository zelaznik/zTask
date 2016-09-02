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

ActiveRecord::Schema.define(version: 20160902042241) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "apps", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "start_cmd",  null: false
    t.string   "stop_cmd",   null: false
    t.string   "repo",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dependencies", force: :cascade do |t|
    t.integer  "parent_app_id", null: false
    t.integer  "child_app_id",  null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["parent_app_id", "child_app_id"], name: "index_dependencies_on_parent_app_id_and_child_app_id", unique: true, using: :btree
  end

  add_foreign_key "dependencies", "apps", column: "child_app_id"
  add_foreign_key "dependencies", "apps", column: "parent_app_id"
end
