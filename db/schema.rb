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

ActiveRecord::Schema.define(version: 20130725174338) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "kobuns", force: true do |t|
    t.integer  "oyabun_id"
    t.text     "body",       null: false
    t.string   "creator",    null: false
    t.string   "editor",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "note_hierarchies", force: true do |t|
    t.integer "ancestor_id",   null: false
    t.integer "descendant_id", null: false
    t.integer "generations",   null: false
  end

  add_index "note_hierarchies", ["ancestor_id", "descendant_id", "generations"], name: "note_anc_desc_udx", unique: true, using: :btree
  add_index "note_hierarchies", ["descendant_id"], name: "note_desc_idx", using: :btree

  create_table "notes", force: true do |t|
    t.string   "title",      null: false
    t.text     "body",       null: false
    t.integer  "parent_id"
    t.string   "creator"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "oyadamas", force: true do |t|
    t.string   "title",      null: false
    t.text     "body",       null: false
    t.string   "creator",    null: false
    t.string   "editor",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
