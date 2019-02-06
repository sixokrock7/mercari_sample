class CreateSellStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :sell_statuses do |t|
      t.string :status, null: false
    end
  end
end
