# frozen_string_literal: true

FactoryBot.define do
  factory :vehicle_model, class: VehicleModel do
    name { 'Golf' }
    brand { build(:vehicle_brand) }
    market_price { 9000 }
  end
end
