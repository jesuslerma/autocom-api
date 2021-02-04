# frozen_string_literal: true

class CreateVehicleRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :vehicle_ratings do |t|
      t.references :vehicle, null: false, index: true, foreign_key: true
      t.integer :price
      t.integer :rating, default: 0

      t.timestamps
    end
  end
end
