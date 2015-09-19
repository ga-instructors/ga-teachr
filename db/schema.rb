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

ActiveRecord::Schema.define(version: 20150919200927) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentications", force: :cascade do |t|
    t.string   "type"
    t.integer  "user_id"
    t.string   "token"
    t.string   "ip_address"
    t.string   "user_agent"
    t.string   "accept_language"
    t.string   "ipinfo_hostname"
    t.string   "ipinfo_city"
    t.string   "ipinfo_region"
    t.string   "ipinfo_country"
    t.string   "ipinfo_org"
    t.string   "ipinfo_postal"
    t.string   "ipinfo_phone"
    t.float    "ipinfo_latitude"
    t.float    "ipinfo_longitude"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "authentications", ["token"], name: "index_authentications_on_token", using: :btree
  add_index "authentications", ["user_id"], name: "index_authentications_on_user_id", using: :btree

  create_table "campuses", force: :cascade do |t|
    t.string   "name"
    t.string   "timezone"
    t.string   "locale"
    t.float    "address_latitude"
    t.float    "address_longitude"
    t.string   "address_street"
    t.string   "address_city"
    t.string   "address_state"
    t.string   "address_country"
    t.string   "address_code"
    t.string   "phone_number"
    t.text     "description"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "cohort_functions", force: :cascade do |t|
    t.string   "type"
    t.integer  "cohort_id"
    t.integer  "employee_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "cohort_functions", ["cohort_id"], name: "index_cohort_functions_on_cohort_id", using: :btree
  add_index "cohort_functions", ["employee_id"], name: "index_cohort_functions_on_employee_id", using: :btree

  create_table "cohorts", force: :cascade do |t|
    t.integer  "campus_id"
    t.integer  "course_id"
    t.string   "name"
    t.datetime "begins_at"
    t.datetime "ends_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "cohorts", ["campus_id"], name: "index_cohorts_on_campus_id", using: :btree
  add_index "cohorts", ["course_id"], name: "index_cohorts_on_course_id", using: :btree

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "title"
    t.string   "email"
    t.integer  "campus_id"
    t.boolean  "debug"
    t.boolean  "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "employees", ["campus_id"], name: "index_employees_on_campus_id", using: :btree
  add_index "employees", ["email"], name: "index_employees_on_email", using: :btree

  create_table "students", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.integer  "cohort_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "students", ["cohort_id"], name: "index_students_on_cohort_id", using: :btree
  add_index "students", ["email"], name: "index_students_on_email", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "password_digest"
    t.integer  "employee_id"
    t.integer  "student_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["employee_id"], name: "index_users_on_employee_id", using: :btree
  add_index "users", ["student_id"], name: "index_users_on_student_id", using: :btree

  add_foreign_key "authentications", "users"
  add_foreign_key "cohort_functions", "cohorts"
  add_foreign_key "cohort_functions", "employees"
  add_foreign_key "cohorts", "campuses"
  add_foreign_key "cohorts", "courses"
  add_foreign_key "employees", "campuses"
  add_foreign_key "students", "cohorts"
  add_foreign_key "users", "employees"
  add_foreign_key "users", "students"
end
