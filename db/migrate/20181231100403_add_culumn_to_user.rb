class AddCulumnToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nickname, :string, null: false
    add_column :users, :phone_number, :integer, null: false, unique: true
    add_column :users, :first_name, :string, null: false
    add_column :users, :last_name, :string, null: false
    add_column :users, :fist_name_kana, :string, null: false
    add_column :users, :last_name_kana, :string, null: false
    add_column :users, :birth_year, :integer, null: false
    add_column :users, :birth_month, :integer, null: false
    add_column :users, :birth_day, :integer, null: false
    add_column :users, :icon_image, :string
    add_column :users, :background_image, :string
    add_column :users, :profile, :text
    add_column :users, :point, :integer
  end
end
