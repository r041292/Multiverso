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

ActiveRecord::Schema.define(version: 20141105160126) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "histories", force: true do |t|
    t.integer  "publication_id_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "histories", ["publication_id_id"], name: "index_histories_on_publication_id_id", using: :btree

  create_table "identities", force: true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "identities", ["user_id"], name: "index_identities_on_user_id", using: :btree

  create_table "publicacion_historia", force: true do |t|
    t.integer  "id_historia"
    t.integer  "id_publicacion"
    t.integer  "l_link"
    t.integer  "r_link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "publicaciones", force: true do |t|
    t.string   "texto"
    t.string   "url"
    t.string   "tipo"
    t.integer  "id_autor"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "publications", force: true do |t|
    t.string   "content"
    t.string   "url"
    t.integer  "user_id_id"
    t.integer  "type"
    t.boolean  "singularity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "publications", ["user_id_id"], name: "index_publications_on_user_id_id", using: :btree

  create_table "publications_and_histories", force: true do |t|
    t.integer  "history_id_id"
    t.integer  "rlink_id"
    t.integer  "llink_id"
    t.integer  "publication_id_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "publications_and_histories", ["history_id_id"], name: "index_publications_and_histories_on_history_id_id", using: :btree
  add_index "publications_and_histories", ["llink_id"], name: "index_publications_and_histories_on_llink_id", using: :btree
  add_index "publications_and_histories", ["publication_id_id"], name: "index_publications_and_histories_on_publication_id_id", using: :btree
  add_index "publications_and_histories", ["rlink_id"], name: "index_publications_and_histories_on_rlink_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
