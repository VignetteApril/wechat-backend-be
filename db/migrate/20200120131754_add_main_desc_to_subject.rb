class AddMainDescToSubject < ActiveRecord::Migration[5.2]
  def change
    add_column :subjects, :main_desc, :string
  end
end
