# frozen_string_literal: true

class AddFinalMarketPriceToVehicle < ActiveRecord::Migration[6.1]
  def change
    add_column :vehicles, :final_market_price, :integer
  end

  def down
    remove_column :vehicles, :final_market_price
  end
end
