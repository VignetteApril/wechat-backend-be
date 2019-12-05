class AddOrderNoToCourse < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :order_no, :integer
  end
end
