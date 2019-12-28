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

ActiveRecord::Schema.define(version: 2019_12_25_133616) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "areas", force: :cascade do |t|
    t.string "name"
    t.integer "code"
    t.integer "area_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ancestry"
    t.index ["ancestry"], name: "index_areas_on_ancestry"
  end

  create_table "book_codes", force: :cascade do |t|
    t.string "code"
    t.integer "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "subject_id"
    t.boolean "is_active", default: false
    t.integer "batch_code"
    t.index ["subject_id"], name: "index_book_codes_on_subject_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.bigint "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order_no"
    t.integer "length"
    t.integer "course_type"
    t.index ["subject_id"], name: "index_courses_on_subject_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone_number"
    t.string "wx_union_id"
    t.string "wx_open_id"
    t.string "order_system_customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name", limit: 200, null: false
    t.text "description"
    t.string "parent_id"
    t.string "ancestry"
    t.string "brief", limit: 100
    t.integer "sort_no"
    t.string "code", limit: 20, default: "0000000000", null: false
    t.string "admin_level", limit: 100
    t.string "role_type", limit: 100
    t.string "contact"
    t.string "orgnization_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ancestry"], name: "index_departments_on_ancestry"
    t.index ["sort_no"], name: "index_departments_on_sort_no"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "title", null: false
    t.text "url", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "features", force: :cascade do |t|
    t.string "name"
    t.string "controller_name"
    t.string "action_names"
    t.string "app"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["controller_name"], name: "index_features_on_controller_name"
  end

  create_table "grades", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order_no"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "channel"
    t.string "title"
    t.string "status"
    t.string "url"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_at"], name: "index_notifications_on_created_at"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "role_features", force: :cascade do |t|
    t.integer "role_id", null: false
    t.integer "feature_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feature_id"], name: "index_role_features_on_feature_id"
    t.index ["role_id"], name: "index_role_features_on_role_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.string "session_id", null: false
    t.text "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "static_images", force: :cascade do |t|
    t.integer "img_type"
    t.integer "order_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.bigint "grade_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order_no"
    t.string "code_prefix"
    t.text "description"
    t.index ["grade_id"], name: "index_subjects_on_grade_id"
  end

  create_table "sys_configs", force: :cascade do |t|
    t.string "key"
    t.string "value"
    t.text "desc"
    t.string "gem"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sys_logs", force: :cascade do |t|
    t.integer "user_id"
    t.text "log_content"
    t.date "log_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["log_date"], name: "index_sys_logs_on_log_date"
    t.index ["user_id"], name: "index_sys_logs_on_user_id"
  end

  create_table "user_roles", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "role_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_user_roles_on_role_id"
    t.index ["user_id"], name: "index_user_roles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "login", limit: 50, null: false
    t.string "name", limit: 20
    t.string "email", limit: 100
    t.string "mobile_phone", limit: 100
    t.string "hashed_password"
    t.string "salt"
    t.integer "department_id"
    t.integer "sort_no"
    t.string "gender", limit: 10
    t.string "address"
    t.text "memo"
    t.boolean "changed_password"
    t.string "orgnization_name", limit: 20
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "session_id"
    t.index ["department_id"], name: "index_users_on_department_id"
    t.index ["sort_no"], name: "index_users_on_sort_no"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "book_codes", "subjects"
  add_foreign_key "courses", "subjects"
  add_foreign_key "subjects", "grades"
end
