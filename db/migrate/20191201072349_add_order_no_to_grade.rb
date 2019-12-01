class AddOrderNoToGrade < ActiveRecord::Migration[5.2]
  def change
    add_column :grades, :order_no, :integer
  end
end
