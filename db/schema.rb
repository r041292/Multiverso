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

ActiveRecord::Schema.define(version: 20141008023956) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "historias", force: true do |t|
    t.integer  "id_singularidad"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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

end