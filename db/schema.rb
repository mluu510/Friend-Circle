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

ActiveRecord::Schema.define(version: 20140225011300) do

  create_table "friend_circle_memberships", force: true do |t|
    t.integer  "friend_id"
    t.integer  "circle_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "friend_circle_memberships", ["circle_id"], name: "index_friend_circle_memberships_on_circle_id"
  add_index "friend_circle_memberships", ["friend_id"], name: "index_friend_circle_memberships_on_friend_id"

  create_table "friend_circles", force: true do |t|
    t.integer  "owner_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "friend_circles", ["owner_id"], name: "index_friend_circles_on_owner_id"

  create_table "links", force: true do |t|
    t.integer  "post_id",    null: false
    t.string   "content",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "links", ["post_id"], name: "index_links_on_post_id"

  create_table "post_shares", force: true do |t|
    t.integer  "post_id",    null: false
    t.integer  "circle_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "post_shares", ["circle_id"], name: "index_post_shares_on_circle_id"
  add_index "post_shares", ["post_id"], name: "index_post_shares_on_post_id"

  create_table "posts", force: true do |t|
    t.string   "body",       null: false
    t.integer  "author_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["author_id"], name: "index_posts_on_author_id"

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "reset_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
