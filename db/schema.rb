# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_03_19_113026) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "documents", force: :cascade do |t|
    t.string "file"
    t.bigint "sender_id", null: false
    t.bigint "recipient_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipient_id"], name: "index_documents_on_recipient_id"
    t.index ["sender_id"], name: "index_documents_on_sender_id"
  end

  create_table "received_documents", force: :cascade do |t|
    t.bigint "document_id", null: false
    t.bigint "sender_id", null: false
    t.bigint "recipient_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_id"], name: "index_received_documents_on_document_id"
    t.index ["recipient_id"], name: "index_received_documents_on_recipient_id"
    t.index ["sender_id"], name: "index_received_documents_on_sender_id"
  end

  create_table "sent_documents", force: :cascade do |t|
    t.bigint "document_id", null: false
    t.bigint "sender_id", null: false
    t.bigint "recipient_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_id"], name: "index_sent_documents_on_document_id"
    t.index ["recipient_id"], name: "index_sent_documents_on_recipient_id"
    t.index ["sender_id"], name: "index_sent_documents_on_sender_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string "subscription_type"
    t.integer "send_limit"
    t.integer "receive_limit"
    t.integer "size_limit"
    t.boolean "automated_transfer"
    t.boolean "bulk_sharing"
    t.boolean "multiple_tracking"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_subscriptions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "jti", null: false
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.bigint "invited_by_id"
    t.integer "invitations_count", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_users_on_invited_by"
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "documents", "users", column: "recipient_id"
  add_foreign_key "documents", "users", column: "sender_id"
  add_foreign_key "received_documents", "documents"
  add_foreign_key "received_documents", "users", column: "recipient_id"
  add_foreign_key "received_documents", "users", column: "sender_id"
  add_foreign_key "sent_documents", "documents"
  add_foreign_key "sent_documents", "users", column: "recipient_id"
  add_foreign_key "sent_documents", "users", column: "sender_id"
  add_foreign_key "subscriptions", "users"
end
