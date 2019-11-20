class RenameProductsIdToAppImage < ActiveRecord::Migration[5.2]
  def change
    rename_column :app_images, :products_id, :product_id
    rename_column :app_images, :product_groups_id, :product_group_id
  end
end
