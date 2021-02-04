# frozen_string_literal: true

class CreateVehicles < ActiveRecord::Migration[6.1]
  def change
    create_table :vehicles do |t|
      t.references :model, null: false, index: true, foreign_key: { to_table: :vehicle_models }
      t.integer :year
      t.integer :mileage
      t.integer :listed_price

      t.timestamps
    end
  end
end
