class AddCodePrefixToSubject < ActiveRecord::Migration[5.2]
  def change
    add_column :subjects, :code_prefix, :string
  end
end
