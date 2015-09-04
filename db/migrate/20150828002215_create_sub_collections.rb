class CreateSubCollections < ActiveRecord::Migration
  def change
    create_table :sub_collections do |t|
      t.string :name
      t.text :description
      t.references :collection

      t.timestamps null: false
    end
  end
end
