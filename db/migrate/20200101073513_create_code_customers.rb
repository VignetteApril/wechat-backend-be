class CreateCodeCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :code_customers do |t|
      t.belongs_to :book_code, foreign_key: true
      t.belongs_to :customer, foreign_key: true

      t.timestamps
    end
  end
end
