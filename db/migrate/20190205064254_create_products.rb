class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :detail
      t.integer :price, null: false
      t.string :status, null: false
      t.references :seller, null: false, foregin_key: { to_table: :users}
      t.references :buyer, null: false, foregin_key: { to_table: :users}
      t.references :brand, null: false, foregin_key: true
      t.references :size, null: false, foregin_key: true
      t.integer :like_count, default: 0
      t.string :delivery_date
      t.references :sell_status, null: false, foregin_key: true
      t.references :product_image, foregin_key: true
      t.references :category, null: false, foregin_key: true
      t.timestamps
    end
  end
end
