# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_10_16_221648) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'pgcrypto'
  enable_extension 'plpgsql'
  enable_extension 'uuid-ossp'

  create_table 'accounts', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'name', null: false
    t.string 'device_number'
    t.string 'device_model'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'comments', force: :cascade do |t|
    t.bigint 'post_id'
    t.uuid 'account_id'
    t.text 'content', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['account_id'], name: 'index_comments_on_account_id'
    t.index ['post_id'], name: 'index_comments_on_post_id'
  end

  create_table 'likes', force: :cascade do |t|
    t.bigint 'post_id'
    t.uuid 'account_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['account_id'], name: 'index_likes_on_account_id'
    t.index ['post_id'], name: 'index_likes_on_post_id'
  end

  create_table 'posts', force: :cascade do |t|
    t.uuid 'account_id'
    t.string 'title', null: false
    t.integer 'likes_count', default: 0
    t.integer 'comments_count', default: 0
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'location', default: ''
    t.float 'latitude'
    t.float 'longitude'
    t.index ['account_id'], name: 'index_posts_on_account_id'
  end

  add_foreign_key 'comments', 'accounts'
  add_foreign_key 'comments', 'posts'
  add_foreign_key 'likes', 'accounts'
  add_foreign_key 'likes', 'posts'
  add_foreign_key 'posts', 'accounts'
end
