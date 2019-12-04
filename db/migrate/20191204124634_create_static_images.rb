class CreateStaticImages < ActiveRecord::Migration[5.2]
  def change
    create_table :static_images do |t|
      t.integer :img_type
      t.integer :order_no

      t.timestamps
    end
  end
end
