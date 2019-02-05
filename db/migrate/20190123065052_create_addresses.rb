class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :first_name_kana, null: false
      t.string :last_name_kana, null: false
      t.string :postal_code, null: false
      t.integer :prefecture_code, null: false
      t.string :city, null: false
      t.string :block_number, null: false
      t.string :building_name
      t.bigint :phone_number
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
