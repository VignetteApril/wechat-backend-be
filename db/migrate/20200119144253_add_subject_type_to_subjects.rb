class AddSubjectTypeToSubjects < ActiveRecord::Migration[5.2]
  def change
    add_column :subjects, :subject_type, :integer
  end
end
