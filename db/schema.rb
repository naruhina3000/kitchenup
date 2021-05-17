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

ActiveRecord::Schema.define(version: 2021_05_17_085234) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "amenities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "bookings", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.integer "total_price"
    t.string "confirmation_code"
    t.string "booking_status", default: "pending"
    t.bigint "user_id", null: false
    t.bigint "kitchen_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["kitchen_id"], name: "index_bookings_on_kitchen_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "kitchen_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["kitchen_id"], name: "index_favorites_on_kitchen_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "kitchen_amenities", force: :cascade do |t|
    t.bigint "kitchen_id", null: false
    t.bigint "amenity_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["amenity_id"], name: "index_kitchen_amenities_on_amenity_id"
    t.index ["kitchen_id"], name: "index_kitchen_amenities_on_kitchen_id"
  end

  create_table "kitchens", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "size"
    t.string "listing_status"
    t.text "address"
    t.integer "price"
    t.string "cancellation_policy"
    t.time "opening_time"
    t.time "closing_time"
    t.integer "views"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_kitchens_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.text "content"
    t.text "reply"
    t.bigint "user_id", null: false
    t.bigint "booking_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["booking_id"], name: "index_reviews_on_booking_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "kitchens"
  add_foreign_key "bookings", "users"
  add_foreign_key "favorites", "kitchens"
  add_foreign_key "favorites", "users"
  add_foreign_key "kitchen_amenities", "amenities"
  add_foreign_key "kitchen_amenities", "kitchens"
  add_foreign_key "kitchens", "users"
  add_foreign_key "reviews", "bookings"
  add_foreign_key "reviews", "users"
end
