class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string   "recipient_name",               limit: 191
      t.string   "recipient_phone_number",       limit: 191
      t.text     "location_title",               limit: 65535
      t.text     "notes",                        limit: 65535
      t.string   "external_id",                  limit: 191
      t.string   "status",                       limit: 191
      t.datetime "delivery_start_time"
      t.datetime "delivery_end_time"
      t.integer  "utensil_sets"
      t.string   "candles",                      limit: 191
      t.integer  "user_id"
      t.string   "zhekou",                       limit: 191
      t.float    "utensils_extra_cost",          limit: 24,                             default: 0.0
      t.string   "payment_method",               limit: 191
      t.float    "transfer_due",                 limit: 24
      t.float    "transfer_received",            limit: 24
      t.string   "pos_external_id",              limit: 191
      t.integer  "points"
      t.integer  "city_id"
      t.float    "delivery_fee",                 limit: 24
      t.integer  "shopping_cart_id"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "customer_name",                limit: 191
      t.float    "cash_pickup_fee",              limit: 24,                             default: 0.0
      t.string   "out_trade_no",                 limit: 191
      t.integer  "subregion_id"
      t.string   "alipay_token",                 limit: 191
      t.datetime "alipay_token_created_at"
      t.text     "referrer",                     limit: 65535
      t.string   "campaign",                     limit: 191
      t.string   "media_qr_external_id",         limit: 191
      t.string   "event_info",                   limit: 191
      t.string   "purchase_source",              limit: 191
      t.boolean  "is_mobile"
      t.string   "zhifubao_trade_no",            limit: 191
      t.float    "products_due",                 limit: 24,                             default: 0.0
      t.integer  "delivery_self_pickup_spot_id"
      t.string   "ziti_zhekou",                                                         default: "1"
      t.string   "discount_method"
      t.boolean  "replace_pay",                                                         default: false
      t.decimal  "baidu_lat",                                  precision: 11, scale: 8
      t.decimal  "baidu_lng",                                  precision: 11, scale: 8
      t.string   "location_address"
      t.string   "location_details"
      t.string   "candle_digits",                                                       default: ""
      t.decimal  "candle_fee",                                 precision: 10,           default: 0
      t.string   "liangma_img_ids",                                                     default: ""
      t.integer  "is_show_picture",                                                     default: 0
      t.text     "free_product",                 limit: 65535
      t.string   "free_product_ids",                                                    default: ""
      t.string   "customer_phone_number",                                               default: ""
      t.integer  "region_id"
      t.boolean  "check_address",                                                       default: false
      t.boolean  "is_web_order",                                                        default: true
      t.string   "fapiao"
      t.string   "fapiao_type"
      t.string   "referral_id"
      t.integer  "adjustment_fee",                                                      default: 0
      t.string   "transaction_id",               limit: 191
      t.boolean  "can_before_delivery",                                                 default: false
      t.float    "udiscount_due",                limit: 24
      t.string   "web_status",                   limit: 20
      t.string   "wx_open_id",                   limit: 50
      t.boolean  "hide_customer_info",                                                  default: false
      t.boolean  "hide_price_info",                                                     default: false
      t.string   "orderer_number",               limit: 20
      t.boolean  "is_gift",                                                             default: false
      t.decimal  "gaode_lng",                                  precision: 11, scale: 8
      t.decimal  "gaode_lat",                                  precision: 11, scale: 8
      t.string   "en_location_title"
      t.string   "en_location_address"
      t.string   "en_location_details"
      t.string   "locale_name",                  limit: 50,                             default: "zh"
      t.string   "address_province"
      t.string   "address_city"
      t.string   "address_district"
      t.integer  "event_points",                                                        default: 0
      t.integer  "fee_region_id",                                                       default: 0
      t.float    "accessory_fee",                limit: 24,                             default: 0.0
      t.text     "extra_info",                   limit: 65535
      t.boolean  "is_store_goods",                                                      default: false
      t.string   "wx_paid_id",                   limit: 50
      t.integer  "groupon_order_id"
      t.integer  "groupon_id"
      t.boolean  "is_emergency",                                                        default: false
      t.text     "instant_delivery_info",        limit: 65535
      t.index ["external_id", "user_id"], name: "index_orders_on_external_id_and_user_id", using: :btree
      t.index ["external_id"], name: "index_orders_on_external_id", using: :btree
      t.index ["groupon_id"], name: "index_orders_on_groupon_id", using: :btree
      t.index ["groupon_order_id"], name: "index_orders_on_groupon_order_id", using: :btree
      t.index ["is_store_goods"], name: "index_orders_on_is_store_goods", using: :btree
      t.index ["out_trade_no"], name: "index_orders_on_out_trade_no", using: :btree
      t.index ["shopping_cart_id"], name: "index_orders_on_shopping_cart_id", using: :btree
      t.index ["status", "wx_open_id"], name: "index_orders_on_status_and_wx_open_id", using: :btree
      t.index ["status"], name: "index_orders_on_status", using: :btree
      t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
      t.index ["web_status"], name: "index_orders_on_web_status", using: :btree
    end
  end
end
