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

ActiveRecord::Schema.define(version: 20160620162847) do

  create_table "article_tags", force: :cascade do |t|
    t.integer  "article_id", null: false
    t.integer  "tag_id",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "article_tags", ["article_id"], name: "index_article_tags_on_article_id"
  add_index "article_tags", ["tag_id"], name: "index_article_tags_on_tag_id"

  create_table "articles", force: :cascade do |t|
    t.integer  "user_id",      null: false
    t.string   "title",        null: false
    t.string   "content",      null: false
    t.integer  "notification", null: false
    t.integer  "view_count",   null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "articles", ["content"], name: "index_articles_on_content"
  add_index "articles", ["title"], name: "index_articles_on_title"
  add_index "articles", ["user_id"], name: "index_articles_on_user_id"

  create_table "attachments", force: :cascade do |t|
    t.integer  "article_id"
    t.string   "filename",   null: false
    t.integer  "bytes"
    t.string   "mime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "attachments", ["article_id"], name: "index_attachments_on_article_id"

  create_table "comments", force: :cascade do |t|
    t.integer  "article_id", null: false
    t.integer  "user_id",    null: false
    t.integer  "parent_id"
    t.string   "content",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["parent_id"], name: "index_comments_on_parent_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "follows", force: :cascade do |t|
    t.integer  "user_id",     null: false
    t.integer  "followee_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "follows", ["followee_id"], name: "index_follows_on_followee_id"
  add_index "follows", ["user_id"], name: "index_follows_on_user_id"

  create_table "tags", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "slug",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tags", ["slug"], name: "index_tags_on_slug"

  create_table "users", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "email",      null: false
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "users", ["email"], name: "index_users_on_email"

  create_table "votes", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "comment_id", null: false
    t.integer  "up"
    t.integer  "down"
    t.integer  "voted_at",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "votes", ["comment_id"], name: "index_votes_on_comment_id"
  add_index "votes", ["user_id"], name: "index_votes_on_user_id"

end
