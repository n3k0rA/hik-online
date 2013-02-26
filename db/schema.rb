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

ActiveRecord::Schema.define(:version => 20130226162735) do

  create_table "alarms", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.boolean  "active",     :default => true
    t.string   "keyword"
    t.string   "where"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "alarms_categories", :id => false, :force => true do |t|
    t.integer "alarm_id"
    t.integer "category_id"
  end

  add_index "alarms_categories", ["alarm_id"], :name => "index_alarms_categories_on_alarm_id"

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "categories_events", :id => false, :force => true do |t|
    t.integer "category_id", :null => false
    t.integer "event_id",    :null => false
  end

  add_index "categories_events", ["category_id", "event_id"], :name => "index_categories_events_on_category_id_and_event_id", :unique => true

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.text     "body"
    t.boolean  "banned"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "comments", ["event_id"], :name => "index_comments_on_event_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "conversations", :force => true do |t|
    t.string   "subject",    :default => ""
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "entries", :force => true do |t|
    t.string   "title_es"
    t.string   "title_eu"
    t.string   "title_fr"
    t.string   "title_en"
    t.text     "body_es"
    t.text     "body_eu"
    t.text     "body_fr"
    t.text     "body_en"
    t.boolean  "es"
    t.boolean  "eu"
    t.boolean  "fr"
    t.boolean  "en"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  create_table "events", :force => true do |t|
    t.datetime "start_date"
    t.datetime "finish_date"
    t.string   "place"
    t.string   "town"
    t.integer  "price",            :default => 0
    t.string   "email"
    t.string   "website"
    t.string   "phone"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.integer  "user_id"
    t.string   "address"
    t.text     "des_es"
    t.text     "des_eu"
    t.text     "des_en"
    t.text     "des_fr"
    t.integer  "views",            :default => 0
    t.string   "title_es"
    t.string   "title_eu"
    t.string   "title_en"
    t.string   "title_fr"
    t.boolean  "approved",         :default => false
    t.boolean  "reminded"
    t.boolean  "cancelled",        :default => false
    t.text     "cancel_message"
    t.string   "province"
    t.string   "tickets"
    t.string   "pic_file_name"
    t.string   "pic_content_type"
    t.integer  "pic_file_size"
    t.datetime "pic_updated_at"
    t.string   "slug"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
  end

  add_index "events", ["slug"], :name => "index_events_on_slug"

  create_table "events_users", :id => false, :force => true do |t|
    t.integer "event_id"
    t.integer "user_id"
  end

  add_index "events_users", ["event_id", "user_id"], :name => "index_events_users_on_event_id_and_user_id"

  create_table "follows", :force => true do |t|
    t.integer  "followable_id",                      :null => false
    t.string   "followable_type",                    :null => false
    t.integer  "follower_id",                        :null => false
    t.string   "follower_type",                      :null => false
    t.boolean  "blocked",         :default => false, :null => false
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  add_index "follows", ["followable_id", "followable_type"], :name => "fk_followables"
  add_index "follows", ["follower_id", "follower_type"], :name => "fk_follows"

  create_table "friendly_id_slugs", :force => true do |t|
    t.string   "slug",                         :null => false
    t.integer  "sluggable_id",                 :null => false
    t.string   "sluggable_type", :limit => 40
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type"], :name => "index_friendly_id_slugs_on_slug_and_sluggable_type", :unique => true
  add_index "friendly_id_slugs", ["sluggable_id"], :name => "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], :name => "index_friendly_id_slugs_on_sluggable_type"

# Could not dump table "microposts" because of following StandardError
#   Unknown type 'reference' for column 'follow_id'

  create_table "notifications", :force => true do |t|
    t.string   "type"
    t.text     "body"
    t.string   "subject",              :default => ""
    t.integer  "sender_id"
    t.string   "sender_type"
    t.integer  "conversation_id"
    t.boolean  "draft",                :default => false
    t.datetime "updated_at",                              :null => false
    t.datetime "created_at",                              :null => false
    t.integer  "notified_object_id"
    t.string   "notified_object_type"
    t.string   "notification_code"
    t.string   "attachment"
  end

  add_index "notifications", ["conversation_id"], :name => "index_notifications_on_conversation_id"

  create_table "receipts", :force => true do |t|
    t.integer  "receiver_id"
    t.string   "receiver_type"
    t.integer  "notification_id",                                  :null => false
    t.boolean  "is_read",                       :default => false
    t.boolean  "trashed",                       :default => false
    t.boolean  "deleted",                       :default => false
    t.string   "mailbox_type",    :limit => 25
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
  end

  add_index "receipts", ["notification_id"], :name => "index_receipts_on_notification_id"

  create_table "reports", :force => true do |t|
    t.integer  "user_id"
    t.integer  "comment_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sponsors", :force => true do |t|
    t.string   "title_es"
    t.string   "title_eu"
    t.string   "title_fr"
    t.string   "title_en"
    t.text     "body_es"
    t.text     "body_eu"
    t.text     "body_fr"
    t.text     "body_en"
    t.boolean  "es"
    t.boolean  "eu"
    t.boolean  "fr"
    t.boolean  "en"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "translations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.text     "des_es"
    t.text     "des_eu"
    t.text     "des_fr"
    t.text     "des_en"
    t.text     "comment"
    t.string   "title_es"
    t.string   "title_eu"
    t.string   "title_fr"
    t.string   "title_en"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "committed",  :default => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "name"
    t.string   "provider"
    t.string   "uid"
    t.string   "town"
    t.string   "gender"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "locale"
    t.string   "province"
    t.string   "website"
    t.boolean  "admin",                  :default => false
    t.string   "slug"
    t.integer  "created",                :default => 0
    t.integer  "translated",             :default => 0
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["slug"], :name => "index_users_on_slug"
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true

end
