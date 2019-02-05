class AddCulumnToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nickname, :string, null: false
    add_column :users, :phone_number, :bigint, null: false, unique: true
    add_column :users, :birth_year, :integer, default: ""
    add_column :users, :birth_month, :integer, default: ""
    add_column :users, :birth_day, :integer, default: ""
    add_column :users, :icon_image, :string
    add_column :users, :background_image, :string
    add_column :users, :credit_card_token, :string, default: ""
    add_column :users, :profile, :text
    add_column :users, :point, :integer
  end
end
