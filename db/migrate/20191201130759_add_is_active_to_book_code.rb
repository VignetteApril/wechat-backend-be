class AddIsActiveToBookCode < ActiveRecord::Migration[5.2]
  def change
    add_column :book_codes, :is_active, :bool, default: false
  end
end
