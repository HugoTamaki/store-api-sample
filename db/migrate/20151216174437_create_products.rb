class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :price
      t.integer :category_id
      t.datetime :released_at

      t.timestamps null: false
    end
  end
end
