class AddLengthToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :length, :integer
  end
end
