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

ActiveRecord::Schema.define(version: 2019_07_22_035736) do

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "app_images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "position"
    t.string "url"
    t.integer "usage_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "product_id"
    t.bigint "product_group_id"
    t.string "pic_size"
    t.index ["product_group_id"], name: "index_app_images_on_product_group_id"
    t.index ["product_id"], name: "index_app_images_on_product_id"
  end

  create_table "areas", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.integer "code"
    t.integer "area_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ancestry"
    t.index ["ancestry"], name: "index_areas_on_ancestry"
  end

  create_table "customers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone_number"
    t.string "wx_union_id"
    t.string "wx_open_id"
    t.string "order_system_customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delayed_jobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
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

  create_table "departments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
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

  create_table "favorites", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "title", null: false
    t.text "url", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "features", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "controller_name"
    t.string "action_names"
    t.string "app"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["controller_name"], name: "index_features_on_controller_name"
  end

  create_table "notifications", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
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

  create_table "orders", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "recipient_name", limit: 191
    t.string "recipient_phone_number", limit: 191
    t.text "location_title"
    t.text "notes"
    t.string "external_id", limit: 191
    t.string "status", limit: 191
    t.datetime "delivery_start_time"
    t.datetime "delivery_end_time"
    t.integer "utensil_sets"
    t.string "candles", limit: 191
    t.integer "user_id"
    t.string "zhekou", limit: 191
    t.float "utensils_extra_cost", default: 0.0
    t.string "payment_method", limit: 191
    t.float "transfer_due"
    t.float "transfer_received"
    t.string "pos_external_id", limit: 191
    t.integer "points"
    t.integer "city_id"
    t.float "delivery_fee"
    t.integer "shopping_cart_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "customer_name", limit: 191
    t.float "cash_pickup_fee", default: 0.0
    t.string "out_trade_no", limit: 191
    t.integer "subregion_id"
    t.string "alipay_token", limit: 191
    t.datetime "alipay_token_created_at"
    t.text "referrer"
    t.string "campaign", limit: 191
    t.string "media_qr_external_id", limit: 191
    t.string "event_info", limit: 191
    t.string "purchase_source", limit: 191
    t.boolean "is_mobile"
    t.string "zhifubao_trade_no", limit: 191
    t.float "products_due", default: 0.0
    t.integer "delivery_self_pickup_spot_id"
    t.string "ziti_zhekou", default: "1"
    t.string "discount_method"
    t.boolean "replace_pay", default: false
    t.decimal "baidu_lat", precision: 11, scale: 8
    t.decimal "baidu_lng", precision: 11, scale: 8
    t.string "location_address"
    t.string "location_details"
    t.string "candle_digits", default: ""
    t.decimal "candle_fee", precision: 10, default: "0"
    t.string "liangma_img_ids", default: ""
    t.integer "is_show_picture", default: 0
    t.text "free_product"
    t.string "free_product_ids", default: ""
    t.string "customer_phone_number", default: ""
    t.integer "region_id"
    t.boolean "check_address", default: false
    t.boolean "is_web_order", default: true
    t.string "fapiao"
    t.string "fapiao_type"
    t.string "referral_id"
    t.integer "adjustment_fee", default: 0
    t.string "transaction_id", limit: 191
    t.boolean "can_before_delivery", default: false
    t.float "udiscount_due"
    t.string "web_status", limit: 20
    t.string "wx_open_id", limit: 50
    t.boolean "hide_customer_info", default: false
    t.boolean "hide_price_info", default: false
    t.string "orderer_number", limit: 20
    t.boolean "is_gift", default: false
    t.decimal "gaode_lng", precision: 11, scale: 8
    t.decimal "gaode_lat", precision: 11, scale: 8
    t.string "en_location_title"
    t.string "en_location_address"
    t.string "en_location_details"
    t.string "locale_name", limit: 50, default: "zh"
    t.string "address_province"
    t.string "address_city"
    t.string "address_district"
    t.integer "event_points", default: 0
    t.integer "fee_region_id", default: 0
    t.float "accessory_fee", default: 0.0
    t.text "extra_info"
    t.boolean "is_store_goods", default: false
    t.string "wx_paid_id", limit: 50
    t.integer "groupon_order_id"
    t.integer "groupon_id"
    t.boolean "is_emergency", default: false
    t.text "instant_delivery_info"
    t.index ["external_id", "user_id"], name: "index_orders_on_external_id_and_user_id"
    t.index ["external_id"], name: "index_orders_on_external_id"
    t.index ["groupon_id"], name: "index_orders_on_groupon_id"
    t.index ["groupon_order_id"], name: "index_orders_on_groupon_order_id"
    t.index ["is_store_goods"], name: "index_orders_on_is_store_goods"
    t.index ["out_trade_no"], name: "index_orders_on_out_trade_no"
    t.index ["shopping_cart_id"], name: "index_orders_on_shopping_cart_id"
    t.index ["status", "wx_open_id"], name: "index_orders_on_status_and_wx_open_id"
    t.index ["status"], name: "index_orders_on_status"
    t.index ["user_id"], name: "index_orders_on_user_id"
    t.index ["web_status"], name: "index_orders_on_web_status"
  end

  create_table "product_groups", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.integer "position"
    t.bigint "product_group_id"
    t.string "chinese_size"
    t.string "english_size"
    t.string "chinese_weight"
    t.string "english_weight"
    t.integer "price"
    t.string "utensils"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_group_id"], name: "index_products_on_product_group_id"
  end

  create_table "role_features", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "role_id", null: false
    t.integer "feature_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feature_id"], name: "index_role_features_on_feature_id"
    t.index ["role_id"], name: "index_role_features_on_role_id"
  end

  create_table "roles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.string "orgnization_name", default: "系统"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sessions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "session_id", null: false
    t.text "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "sys_configs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "key"
    t.string "value"
    t.text "desc"
    t.string "gem"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sys_logs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id"
    t.text "log_content"
    t.date "log_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["log_date"], name: "index_sys_logs_on_log_date"
    t.index ["user_id"], name: "index_sys_logs_on_user_id"
  end

  create_table "user_roles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "role_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_user_roles_on_role_id"
    t.index ["user_id"], name: "index_user_roles_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
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
  add_foreign_key "app_images", "product_groups"
  add_foreign_key "app_images", "products"
  add_foreign_key "products", "product_groups"
end
