# frozen_string_literal: true

class CreateVehicleModels < ActiveRecord::Migration[6.1]
  def change
    create_table :vehicle_models do |t|
      t.references :brand, null: false, index: true, foreign_key: { to_table: :vehicle_brands }
      t.string :name
      t.integer :market_price

      t.timestamps
    end
  end
end
