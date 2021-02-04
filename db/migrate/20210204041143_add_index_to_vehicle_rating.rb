# frozen_string_literal: true

class AddIndexToVehicleRating < ActiveRecord::Migration[6.1]
  def change
    add_index :vehicle_ratings, :rating
  end

  def down
    remove_index :vehicle_ratings, :rating
  end
end
