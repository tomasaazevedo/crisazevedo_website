class CreateHighlights < ActiveRecord::Migration
  def change
    create_table :highlights do |t|
      t.string :title
      t.string :details
      t.string :link
      t.boolean :is_active
      t.attachment :image

      t.timestamps null: false
    end
  end
end
