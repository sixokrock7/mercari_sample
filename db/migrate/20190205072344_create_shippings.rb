class CreateShippings < ActiveRecord::Migration[5.2]
  def change
    create_table :shippings do |t|
      t.string :shipping_burden, null: false
      t.string :shipping_method, null: false
      t.string :shipping_area, null: false
      t.string :delivery_date, null: false
    end
  end
end
