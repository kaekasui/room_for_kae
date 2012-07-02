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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120702035826) do

  create_table "blogs", :force => true do |t|
    t.string   "title"
    t.integer  "blog_category_code"
    t.text     "contents1"
    t.text     "contents2"
    t.boolean  "draft"
    t.datetime "deleted_at"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "updated_informations", :force => true do |t|
    t.date     "display_at"
    t.integer  "version_id"
    t.string   "title"
    t.text     "news"
    t.text     "comment"
    t.boolean  "draft"
    t.datetime "deleted_at"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "mini_label"
    t.string   "mini_label_option"
  end

  create_table "users", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "screen_name"
    t.string   "image"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
