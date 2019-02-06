class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.references :product, foregin_key: true
      t.integer :lft
      t.integer :rgt
    end
  end
end
