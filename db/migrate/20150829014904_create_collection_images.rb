class CreateCollectionImages < ActiveRecord::Migration
  def change
    create_table :collection_images do |t|
      t.attachment :collection_image
      t.references :collection

      t.timestamps null: false
    end
  end
end
