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

ActiveRecord::Schema.define(version: 20171114112354) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abouts", force: :cascade do |t|
    t.boolean "current", default: false
    t.text "about_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "appliances", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.float "price"
    t.integer "discount", default: 0
    t.float "widths"
    t.float "height"
    t.float "depth"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "main_image"
    t.integer "availability"
  end

  create_table "appliances_categories", force: :cascade do |t|
    t.bigint "category_id"
    t.bigint "appliance_id"
    t.index ["appliance_id"], name: "index_appliances_categories_on_appliance_id"
    t.index ["category_id"], name: "index_appliances_categories_on_category_id"
  end

  create_table "appliances_colors", force: :cascade do |t|
    t.bigint "appliance_id"
    t.bigint "color_id"
    t.index ["appliance_id"], name: "index_appliances_colors_on_appliance_id"
    t.index ["color_id"], name: "index_appliances_colors_on_color_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "type"
    t.string "name"
  end

  create_table "categories_furnitures", force: :cascade do |t|
    t.bigint "category_id"
    t.bigint "furniture_id"
    t.index ["category_id"], name: "index_categories_furnitures_on_category_id"
    t.index ["furniture_id"], name: "index_categories_furnitures_on_furniture_id"
  end

  create_table "client_overviews", force: :cascade do |t|
    t.string "file"
    t.text "review"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "colors", force: :cascade do |t|
    t.string "type"
    t.string "name"
    t.string "rgb"
  end

  create_table "colors_furnitures", force: :cascade do |t|
    t.bigint "furniture_id"
    t.bigint "color_id"
    t.index ["color_id"], name: "index_colors_furnitures_on_color_id"
    t.index ["furniture_id"], name: "index_colors_furnitures_on_furniture_id"
  end

  create_table "contact_mails", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "furnitures", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.float "price"
    t.integer "discount", default: 0
    t.float "widths"
    t.float "height"
    t.float "depth"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "main_image"
    t.integer "availability"
  end

  create_table "index_overviews", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "index_pictures", force: :cascade do |t|
    t.string "file"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "main_products", force: :cascade do |t|
    t.string "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pictures", force: :cascade do |t|
    t.string "type"
    t.integer "model_id"
    t.string "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "appliances_categories", "appliances"
  add_foreign_key "appliances_categories", "categories"
  add_foreign_key "appliances_colors", "appliances"
  add_foreign_key "appliances_colors", "colors"
  add_foreign_key "categories_furnitures", "categories"
  add_foreign_key "categories_furnitures", "furnitures"
  add_foreign_key "colors_furnitures", "colors"
  add_foreign_key "colors_furnitures", "furnitures"
end
