class ChangeRefOnBookCode < ActiveRecord::Migration[5.2]
  def change
    remove_column :book_codes, :course_id,  index: true, foreign_key: true
    add_reference :book_codes, :subject, index: true, foreign_key: true
  end
end
