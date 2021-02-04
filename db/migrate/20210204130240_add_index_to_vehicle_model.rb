# frozen_string_literal: true

class AddIndexToVehicleModel < ActiveRecord::Migration[6.1]
  def change
    add_index :vehicle_models, :name, unique: true
  end

  def down
    remove_index :vehicle_models, :name
  end
end
