class AddPicSizeToAppImage < ActiveRecord::Migration[5.2]
  def change
    add_column :app_images, :pic_size, :string
  end
end
