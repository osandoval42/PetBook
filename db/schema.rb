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

ActiveRecord::Schema.define(version: 20160708082026) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "albums", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.string   "title",      null: false
    t.text     "caption"
    t.date     "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "albums", ["user_id", "title"], name: "index_albums_on_user_id_and_title", unique: true, using: :btree
  add_index "albums", ["user_id"], name: "index_albums_on_user_id", using: :btree

  create_table "friendships", force: :cascade do |t|
    t.integer  "requestor_id",                 null: false
    t.integer  "requestee_id",                 null: false
    t.boolean  "accepted",     default: false, null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "friendships", ["requestee_id"], name: "index_friendships_on_requestee_id", using: :btree
  add_index "friendships", ["requestor_id", "requestee_id"], name: "index_friendships_on_requestor_id_and_requestee_id", unique: true, using: :btree
  add_index "friendships", ["requestor_id"], name: "index_friendships_on_requestor_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.text     "body",        null: false
    t.integer  "sender_id",   null: false
    t.integer  "receiver_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "messages", ["receiver_id"], name: "index_messages_on_receiver_id", using: :btree
  add_index "messages", ["sender_id"], name: "index_messages_on_sender_id", using: :btree

  create_table "photo_comments", force: :cascade do |t|
    t.integer  "photo_id",   null: false
    t.integer  "user_id",    null: false
    t.text     "comment",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "photo_comments", ["photo_id"], name: "index_photo_comments_on_photo_id", using: :btree
  add_index "photo_comments", ["user_id"], name: "index_photo_comments_on_user_id", using: :btree

  create_table "photo_likes", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "photo_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "photo_likes", ["photo_id", "user_id"], name: "index_photo_likes_on_photo_id_and_user_id", unique: true, using: :btree
  add_index "photo_likes", ["photo_id"], name: "index_photo_likes_on_photo_id", using: :btree
  add_index "photo_likes", ["user_id"], name: "index_photo_likes_on_user_id", using: :btree

  create_table "photos", force: :cascade do |t|
    t.integer  "album_id",                   null: false
    t.string   "img_url",                    null: false
    t.boolean  "profile",    default: false
    t.boolean  "cover",      default: false, null: false
    t.date     "date",                       null: false
    t.text     "caption"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "photos", ["album_id"], name: "index_photos_on_album_id", using: :btree
  add_index "photos", ["img_url", "album_id"], name: "index_photos_on_img_url_and_album_id", using: :btree

  create_table "post_comments", force: :cascade do |t|
    t.integer  "post_id",   null: false
    t.integer  "user_id",    null: false
    t.text     "body",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "post_comments", ["post_id"], name: "index_post_comments_on_post_id", using: :btree
  add_index "post_comments", ["user_id"], name: "index_post_comments_on_user_id", using: :btree

  create_table "post_likes", force: :cascade do |t|
    t.integer  "post_id",    null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "post_likes", ["post_id"], name: "index_post_likes_on_post_id", using: :btree
  add_index "post_likes", ["user_id"], name: "index_post_likes_on_user_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.integer  "author_id",  null: false
    t.integer  "wall_id",    null: false
    t.text     "body",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "posts", ["author_id"], name: "index_posts_on_author_id", using: :btree
  add_index "posts", ["wall_id"], name: "index_posts_on_wall_id", using: :btree

  create_table "relationships", force: :cascade do |t|
    t.integer  "requestor_id",                 null: false
    t.integer  "requestee_id",                 null: false
    t.boolean  "accepted",     default: false, null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "relationships", ["requestee_id"], name: "index_relationships_on_requestee_id", unique: true, using: :btree
  add_index "relationships", ["requestor_id"], name: "index_relationships_on_requestor_id", unique: true, using: :btree

  create_table "shares", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "post_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "shares", ["post_id", "user_id"], name: "index_shares_on_post_id_and_user_id", unique: true, using: :btree
  add_index "shares", ["post_id"], name: "index_shares_on_post_id", using: :btree
  add_index "shares", ["user_id"], name: "index_shares_on_user_id", using: :btree

  create_table "taggings", force: :cascade do |t|
    t.integer  "photo_id",   null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "taggings", ["photo_id", "user_id"], name: "index_taggings_on_photo_id_and_user_id", unique: true, using: :btree
  add_index "taggings", ["photo_id"], name: "index_taggings_on_photo_id", using: :btree
  add_index "taggings", ["user_id"], name: "index_taggings_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",        null: false
    t.string   "password_digest", null: false
    t.string   "email",           null: false
    t.string   "session_token",   null: false
    t.string   "gender"
    t.string   "breed"
    t.date     "birthday"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["session_token"], name: "index_users_on_session_token", unique: true, using: :btree

end
