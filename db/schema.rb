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

ActiveRecord::Schema[8.0].define(version: 2025_02_27_175010) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "address"
    t.text "gender"
    t.integer "age"
    t.decimal "salary"
  end

  create_table "old_cars", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.string "model"
    t.integer "year"
    t.decimal "engine_ltr"
    t.decimal "horsepower"
    t.decimal "torque_lb"
    t.decimal "time_60"
    t.decimal "price_old"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "company"
    t.index ["company_id"], name: "index_old_cars_on_company_id"
  end

  create_table "sales", force: :cascade do |t|
    t.bigint "old_car_id", null: false
    t.bigint "customer_id", null: false
    t.decimal "sale_price"
    t.date "sale_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_sales_on_customer_id"
    t.index ["old_car_id"], name: "index_sales_on_old_car_id"
  end

  add_foreign_key "old_cars", "companies"
  add_foreign_key "sales", "customers"
  add_foreign_key "sales", "old_cars"
end
