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

ActiveRecord::Schema.define(version: 2020_10_03_165820) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "aprils", force: :cascade do |t|
    t.date "occourance"
    t.text "name"
    t.text "reason"
    t.integer "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "year_id"
    t.index ["year_id"], name: "index_aprils_on_year_id"
  end

  create_table "augusts", force: :cascade do |t|
    t.date "occourance"
    t.text "name"
    t.text "reason"
    t.integer "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "year_id"
    t.index ["year_id"], name: "index_augusts_on_year_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id"
    t.bigint "story_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["story_id"], name: "index_comments_on_story_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "communities", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "doc"
  end

  create_table "decembers", force: :cascade do |t|
    t.date "occourance"
    t.text "name"
    t.text "reason"
    t.integer "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "year_id"
    t.index ["year_id"], name: "index_decembers_on_year_id"
  end

  create_table "februaries", force: :cascade do |t|
    t.date "occourance"
    t.text "name"
    t.text "reason"
    t.integer "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "year_id"
    t.index ["year_id"], name: "index_februaries_on_year_id"
  end

  create_table "feedbacks", force: :cascade do |t|
    t.date "date"
    t.integer "uipoints"
    t.integer "usability"
    t.integer "improvement"
    t.text "comments"
    t.text "addfeatures"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_feedbacks_on_user_id"
  end

  create_table "impressions", force: :cascade do |t|
    t.string "impressionable_type"
    t.integer "impressionable_id"
    t.integer "user_id"
    t.string "controller_name"
    t.string "action_name"
    t.string "view_name"
    t.string "request_hash"
    t.string "ip_address"
    t.string "session_hash"
    t.text "message"
    t.text "referrer"
    t.text "params"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["controller_name", "action_name", "ip_address"], name: "controlleraction_ip_index"
    t.index ["controller_name", "action_name", "request_hash"], name: "controlleraction_request_index"
    t.index ["controller_name", "action_name", "session_hash"], name: "controlleraction_session_index"
    t.index ["impressionable_type", "impressionable_id", "ip_address"], name: "poly_ip_index"
    t.index ["impressionable_type", "impressionable_id", "params"], name: "poly_params_request_index"
    t.index ["impressionable_type", "impressionable_id", "request_hash"], name: "poly_request_index"
    t.index ["impressionable_type", "impressionable_id", "session_hash"], name: "poly_session_index"
    t.index ["impressionable_type", "message", "impressionable_id"], name: "impressionable_type_message_index"
    t.index ["user_id"], name: "index_impressions_on_user_id"
  end

  create_table "januaries", force: :cascade do |t|
    t.date "occourance"
    t.text "name"
    t.text "reason"
    t.integer "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "year_id"
    t.index ["year_id"], name: "index_januaries_on_year_id"
  end

  create_table "julies", force: :cascade do |t|
    t.date "occourance"
    t.text "name"
    t.text "reason"
    t.integer "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "year_id"
    t.index ["year_id"], name: "index_julies_on_year_id"
  end

  create_table "junes", force: :cascade do |t|
    t.date "occourance"
    t.text "name"
    t.text "reason"
    t.integer "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "year_id"
    t.index ["year_id"], name: "index_junes_on_year_id"
  end

  create_table "mailboxer_conversation_opt_outs", id: :serial, force: :cascade do |t|
    t.string "unsubscriber_type"
    t.integer "unsubscriber_id"
    t.integer "conversation_id"
    t.index ["conversation_id"], name: "index_mailboxer_conversation_opt_outs_on_conversation_id"
    t.index ["unsubscriber_id", "unsubscriber_type"], name: "index_mailboxer_conversation_opt_outs_on_unsubscriber_id_type"
  end

  create_table "mailboxer_conversations", id: :serial, force: :cascade do |t|
    t.string "subject", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mailboxer_notifications", id: :serial, force: :cascade do |t|
    t.string "type"
    t.text "body"
    t.string "subject", default: ""
    t.string "sender_type"
    t.integer "sender_id"
    t.integer "conversation_id"
    t.boolean "draft", default: false
    t.string "notification_code"
    t.string "notified_object_type"
    t.integer "notified_object_id"
    t.string "attachment"
    t.datetime "updated_at", null: false
    t.datetime "created_at", null: false
    t.boolean "global", default: false
    t.datetime "expires"
    t.index ["conversation_id"], name: "index_mailboxer_notifications_on_conversation_id"
    t.index ["notified_object_id", "notified_object_type"], name: "index_mailboxer_notifications_on_notified_object_id_and_type"
    t.index ["notified_object_type", "notified_object_id"], name: "mailboxer_notifications_notified_object"
    t.index ["sender_id", "sender_type"], name: "index_mailboxer_notifications_on_sender_id_and_sender_type"
    t.index ["type"], name: "index_mailboxer_notifications_on_type"
  end

  create_table "mailboxer_receipts", id: :serial, force: :cascade do |t|
    t.string "receiver_type"
    t.integer "receiver_id"
    t.integer "notification_id", null: false
    t.boolean "is_read", default: false
    t.boolean "trashed", default: false
    t.boolean "deleted", default: false
    t.string "mailbox_type", limit: 25
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_delivered", default: false
    t.string "delivery_method"
    t.string "message_id"
    t.index ["notification_id"], name: "index_mailboxer_receipts_on_notification_id"
    t.index ["receiver_id", "receiver_type"], name: "index_mailboxer_receipts_on_receiver_id_and_receiver_type"
  end

  create_table "marches", force: :cascade do |t|
    t.date "occourance"
    t.text "name"
    t.text "reason"
    t.integer "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "year_id"
    t.index ["year_id"], name: "index_marches_on_year_id"
  end

  create_table "mays", force: :cascade do |t|
    t.date "occourance"
    t.text "name"
    t.text "reason"
    t.integer "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "year_id"
    t.index ["year_id"], name: "index_mays_on_year_id"
  end

  create_table "novembers", force: :cascade do |t|
    t.date "occourance"
    t.text "name"
    t.text "reason"
    t.integer "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "year_id"
    t.index ["year_id"], name: "index_novembers_on_year_id"
  end

  create_table "octobers", force: :cascade do |t|
    t.date "occourance"
    t.text "name"
    t.text "reason"
    t.integer "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "year_id"
    t.index ["year_id"], name: "index_octobers_on_year_id"
  end

  create_table "researches", force: :cascade do |t|
    t.text "mainheading"
    t.text "subheading"
    t.date "contributed"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "septembers", force: :cascade do |t|
    t.date "occourance"
    t.text "name"
    t.text "reason"
    t.integer "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "year_id"
    t.index ["year_id"], name: "index_septembers_on_year_id"
  end

  create_table "stories", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "topic_id"
    t.bigint "user_id"
    t.index ["topic_id"], name: "index_stories_on_topic_id"
    t.index ["user_id"], name: "index_stories_on_user_id"
  end

  create_table "targets", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.date "begin"
    t.date "end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "doc"
    t.bigint "user_id"
    t.text "res", default: [], array: true
    t.integer "member", default: [], array: true
    t.integer "lead"
    t.index ["user_id"], name: "index_targets_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.date "dateofcompletion"
    t.integer "point"
    t.integer "progress"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "target_id"
    t.integer "status"
    t.integer "owner"
    t.index ["target_id"], name: "index_tasks_on_target_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "roles"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "words", force: :cascade do |t|
    t.string "wordtitle"
    t.text "meaning"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "years", force: :cascade do |t|
    t.integer "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.integer "limit"
    t.index ["user_id"], name: "index_years_on_user_id"
  end

  add_foreign_key "aprils", "years"
  add_foreign_key "augusts", "years"
  add_foreign_key "comments", "stories"
  add_foreign_key "comments", "users"
  add_foreign_key "decembers", "years"
  add_foreign_key "februaries", "years"
  add_foreign_key "feedbacks", "users"
  add_foreign_key "januaries", "years"
  add_foreign_key "julies", "years"
  add_foreign_key "junes", "years"
  add_foreign_key "mailboxer_conversation_opt_outs", "mailboxer_conversations", column: "conversation_id", name: "mb_opt_outs_on_conversations_id"
  add_foreign_key "mailboxer_notifications", "mailboxer_conversations", column: "conversation_id", name: "notifications_on_conversation_id"
  add_foreign_key "mailboxer_receipts", "mailboxer_notifications", column: "notification_id", name: "receipts_on_notification_id"
  add_foreign_key "marches", "years"
  add_foreign_key "mays", "years"
  add_foreign_key "novembers", "years"
  add_foreign_key "octobers", "years"
  add_foreign_key "septembers", "years"
  add_foreign_key "stories", "topics"
  add_foreign_key "stories", "users"
  add_foreign_key "targets", "users"
  add_foreign_key "tasks", "targets"
  add_foreign_key "years", "users"
end
