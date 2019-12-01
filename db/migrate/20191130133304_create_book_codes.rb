class CreateBookCodes < ActiveRecord::Migration[5.2]
  def change
    create_table :book_codes do |t|
      t.string :code
      t.integer :customer_id
      t.belongs_to :course, foreign_key: true

      t.timestamps
    end
  end
end
