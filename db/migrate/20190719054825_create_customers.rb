class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.string :wx_union_id
      t.string :wx_open_id
      t.string :order_system_customer_id

      t.timestamps
    end
  end
end
