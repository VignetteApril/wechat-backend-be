class RenameTypeToAppImage < ActiveRecord::Migration[5.2]
  def change
    rename_column :app_images, :type, :usage_type
  end
end
