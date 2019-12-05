class AddDescriptionToSubject < ActiveRecord::Migration[5.2]
  def change
    add_column :subjects, :description, :text
  end
end
