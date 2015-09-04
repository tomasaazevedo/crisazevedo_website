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

ActiveRecord::Schema.define(version: 20150901174420) do

  create_table "collection_images", force: :cascade do |t|
    t.string   "collection_image_file_name"
    t.string   "collection_image_content_type"
    t.integer  "collection_image_file_size"
    t.datetime "collection_image_updated_at"
    t.integer  "collection_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "collections", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "highlights", force: :cascade do |t|
    t.string   "title"
    t.string   "details"
    t.string   "link"
    t.boolean  "is_active"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "product_images", force: :cascade do |t|
    t.string   "product_image_file_name"
    t.string   "product_image_content_type"
    t.integer  "product_image_file_size"
    t.datetime "product_image_updated_at"
    t.integer  "product_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.text     "dimensions"
    t.string   "weight"
    t.string   "material"
    t.string   "product_code"
    t.boolean  "is_new_release"
    t.string   "type"
    t.integer  "collection_id"
    t.integer  "sub_collection_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "sub_collection_images", force: :cascade do |t|
    t.string   "sub_collection_image_file_name"
    t.string   "sub_collection_image_content_type"
    t.integer  "sub_collection_image_file_size"
    t.datetime "sub_collection_image_updated_at"
    t.integer  "sub_collection_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "sub_collections", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "collection_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.string   "role"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
