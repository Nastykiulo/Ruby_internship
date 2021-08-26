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

ActiveRecord::Schema.define(version: 2021_08_24_162831) do

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
    t.integer "role"
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "albums", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "band_id"
    t.index ["band_id"], name: "index_albums_on_band_id"
  end

  create_table "answer_items", force: :cascade do |t|
    t.string "title"
    t.boolean "correct"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "answers", force: :cascade do |t|
    t.string "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "assignments", force: :cascade do |t|
    t.bigint "test_id"
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_assignments_on_student_id"
    t.index ["test_id"], name: "index_assignments_on_test_id"
  end

  create_table "bands", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string "question"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "test_id"
    t.bigint "answer_item_id"
    t.index ["answer_item_id"], name: "index_questions_on_answer_item_id"
    t.index ["test_id"], name: "index_questions_on_test_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.float "gpa"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students_tests", force: :cascade do |t|
    t.bigint "test_id"
    t.bigint "student_id"
    t.index ["student_id"], name: "index_students_tests_on_student_id"
    t.index ["test_id"], name: "index_students_tests_on_test_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "last_name"
    t.string "telephone"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
  end

  create_table "test_result_items", force: :cascade do |t|
    t.bigint "question_id"
    t.integer "student_answer_id"
    t.bigint "test_result_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_test_result_items_on_question_id"
    t.index ["test_result_id"], name: "index_test_result_items_on_test_result_id"
  end

  create_table "test_results", force: :cascade do |t|
    t.bigint "assignment_id"
    t.boolean "pass"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assignment_id"], name: "index_test_results_on_assignment_id"
  end

  create_table "tests", force: :cascade do |t|
    t.string "title"
    t.string "status"
    t.date "due_date"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "teacher_id"
    t.string "category"
    t.index ["teacher_id"], name: "index_tests_on_teacher_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role"
    t.string "type"
    t.string "first_name"
    t.string "last_name"
    t.string "telephone"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "albums", "bands"
  add_foreign_key "assignments", "students"
  add_foreign_key "assignments", "tests"
  add_foreign_key "questions", "answer_items"
  add_foreign_key "students_tests", "students"
  add_foreign_key "students_tests", "tests"
  add_foreign_key "test_result_items", "questions"
  add_foreign_key "test_result_items", "test_results"
  add_foreign_key "test_results", "assignments"
end
