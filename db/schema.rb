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

ActiveRecord::Schema.define(version: 2020_11_09_221746) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "candidatures", force: :cascade do |t|
    t.bigint "journey_id"
    t.bigint "doctor_id"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["doctor_id"], name: "index_candidatures_on_doctor_id"
    t.index ["journey_id"], name: "index_candidatures_on_journey_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "cnpj"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "description"
    t.string "address"
    t.string "phone"
  end

  create_table "doctors", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "crm"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "phone"
    t.string "formation"
    t.string "experiences"
  end

  create_table "journeys", force: :cascade do |t|
    t.bigint "company_id"
    t.bigint "doctor_id"
    t.string "name"
    t.datetime "date"
    t.datetime "payment_date"
    t.string "payment_method"
    t.float "wage"
    t.boolean "provides_ppe"
    t.string "hire_entity"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_journeys_on_company_id"
    t.index ["doctor_id"], name: "index_journeys_on_doctor_id"
  end

  create_table "managers", force: :cascade do |t|
    t.bigint "company_id"
    t.string "name"
    t.string "email"
    t.string "cpf"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_managers_on_company_id"
  end

end
