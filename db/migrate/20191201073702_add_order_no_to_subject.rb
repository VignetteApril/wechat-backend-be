class AddOrderNoToSubject < ActiveRecord::Migration[5.2]
  def change
    add_column :subjects, :order_no, :integer
  end
end
