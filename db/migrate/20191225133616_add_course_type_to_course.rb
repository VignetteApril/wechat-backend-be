class AddCourseTypeToCourse < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :course_type, :integer
  end
end
