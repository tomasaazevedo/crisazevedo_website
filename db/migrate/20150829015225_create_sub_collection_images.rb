class CreateSubCollectionImages < ActiveRecord::Migration
  def change
    create_table :sub_collection_images do |t|
      t.attachment :sub_collection_image
      t.references :sub_collection

      t.timestamps null: false
    end
  end
end
