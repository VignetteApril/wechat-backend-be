class CreateTextSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :text_settings do |t|
      t.string :content
      t.integer :content_type

      t.timestamps
    end
  end
end
