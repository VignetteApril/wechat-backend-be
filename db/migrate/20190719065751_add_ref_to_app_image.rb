class AddRefToAppImage < ActiveRecord::Migration[5.2]
  def change
    add_reference :app_images, :products, foreign_key: true
    add_reference :app_images, :product_groups, foreign_key: true
  end
end
