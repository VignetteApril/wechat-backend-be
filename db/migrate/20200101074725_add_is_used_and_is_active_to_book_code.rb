class AddIsUsedAndIsActiveToBookCode < ActiveRecord::Migration[5.2]
  def change
    add_column :book_codes, :is_used, :boolean, default: false
    add_column :book_codes, :is_actived, :boolean, default: true
  end
end
