class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title
      t.integer :position
      t.belongs_to :product_group, foreign_key: true
      t.string :chinese_size
      t.string :english_size
      t.string :chinese_weight
      t.string :english_weight
      t.integer :price
      t.string :utensils

      t.timestamps
    end
  end
end
