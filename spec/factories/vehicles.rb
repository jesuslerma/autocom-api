# frozen_string_literal: true

FactoryBot.define do
  factory :vehicle, class: Vehicle do
    model { build(:vehicle_model) }
    listed_price { 9000 }
    year { 2020 }
    mileage { 100_000 }
  end
end
