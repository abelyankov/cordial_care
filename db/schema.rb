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

ActiveRecord::Schema.define(version: 2019_07_22_100122) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "access_tokens", force: :cascade do |t|
    t.string "token"
    t.bigint "expert_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expert_id"], name: "index_access_tokens_on_expert_id"
  end

  create_table "admins", force: :cascade do |t|
    t.string "username", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["username"], name: "index_admins_on_username", unique: true
  end

  create_table "brands", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string "city", null: false
    t.string "country", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "member_roles", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
    t.bigint "member_role_id", null: false
    t.bigint "user_id", null: false
    t.bigint "team_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_role_id"], name: "index_members_on_member_role_id"
    t.index ["team_id"], name: "index_members_on_team_id"
    t.index ["user_id"], name: "index_members_on_user_id"
  end

  create_table "product_categories", force: :cascade do |t|
    t.string "name", null: false
    t.string "ancestry"
    t.string "names_depth_cache"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ancestry"], name: "index_product_categories_on_ancestry"
  end

  create_table "products", force: :cascade do |t|
    t.string "code", null: false
    t.string "name_eng", null: false
    t.string "name_rus"
    t.bigint "product_category_id"
    t.bigint "brand_id"
    t.integer "membership_price_kzt"
    t.integer "purchasing_price_kzt"
    t.date "price_period"
    t.string "freight"
    t.integer "import_duty"
    t.integer "vat"
    t.string "handling_charge"
    t.string "unit_type"
    t.integer "unit_price"
    t.integer "basic_commission"
    t.integer "total_commission"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_products_on_brand_id"
    t.index ["product_category_id"], name: "index_products_on_product_category_id"
  end

  create_table "sale_types", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sales", force: :cascade do |t|
    t.bigint "sale_type_id"
    t.date "sale_date"
    t.bigint "seller_id"
    t.bigint "buyer_id"
    t.bigint "team_id"
    t.bigint "product_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["buyer_id"], name: "index_sales_on_buyer_id"
    t.index ["product_id"], name: "index_sales_on_product_id"
    t.index ["sale_type_id"], name: "index_sales_on_sale_type_id"
    t.index ["seller_id"], name: "index_sales_on_seller_id"
    t.index ["team_id"], name: "index_sales_on_team_id"
  end

  create_table "sales_products", force: :cascade do |t|
    t.string "productable_type"
    t.bigint "productable_id"
    t.bigint "product_id", null: false
    t.integer "quantity", null: false
    t.integer "amount", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_sales_products_on_product_id"
    t.index ["productable_type", "productable_id"], name: "index_sales_products_on_productable_type_and_productable_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "location_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_teams_on_location_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone_number"
    t.string "address"
    t.date "birthday"
    t.string "marital_status"
    t.string "gender"
    t.string "username", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["phone_number"], name: "index_users_on_phone_number", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "sales", "members", column: "buyer_id"
  add_foreign_key "sales", "members", column: "seller_id"
end
