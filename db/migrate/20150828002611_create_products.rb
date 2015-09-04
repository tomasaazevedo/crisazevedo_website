class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.text :dimensions
      t.string :weight
      t.string :material
      t.string :product_code
      t.boolean :is_new_release
      t.string :type
      t.references :collection
      t.references :sub_collection

      t.timestamps null: false
    end
  end
end
