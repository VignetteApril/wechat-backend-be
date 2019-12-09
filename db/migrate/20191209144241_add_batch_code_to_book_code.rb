class AddBatchCodeToBookCode < ActiveRecord::Migration[5.2]
  def change
    add_column :book_codes, :batch_code, :integer
  end
end
