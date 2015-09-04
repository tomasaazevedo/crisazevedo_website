class CreateProductImages < ActiveRecord::Migration
  def change
    create_table :product_images do |t|
      t.attachment :product_image
      t.references :product

      t.timestamps null: false
    end
  end
end
