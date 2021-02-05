# frozen_string_literal: true

# Vehicle Brands
%w[VW Chevrolet Nissan].each do |name|
  VehicleBrand.create(name: name)
end

# VehicleModels
brand = VehicleBrand.find_by(name: 'VW')
[
  {
    brand: brand,
    name: 'JETTA',
    market_price: 300_000
  },
  {
    brand: brand,
    name: 'POLLO',
    market_price: 250_000
  },
  {
    brand: brand,
    name: 'GOLF',
    market_price: 270_000
  },
  {
    brand: brand,
    name: 'UP',
    market_price: 200_000
  }
].each do |vehicle_model|
  VehicleModel.create(vehicle_model)
end

brand = VehicleBrand.find_by(name: 'Chevrolet')
[
  {
    brand: brand,
    name: 'TRAILBLAZER',
    market_price: 350_000
  },
  {
    brand: brand,
    name: 'SONIC',
    market_price: 250_000
  },
  {
    brand: brand,
    name: 'BOLT',
    market_price: 270_000
  },
  {
    brand: brand,
    name: 'BLAZER',
    market_price: 300_000
  }
].each do |vehicle_model|
  VehicleModel.create(vehicle_model)
end
brand = VehicleBrand.find_by(name: 'Nissan')
[
  {
    brand: brand,
    name: 'KICKS',
    market_price: 300_000
  },
  {
    brand: brand,
    name: 'SENTRA',
    market_price: 250_000
  },
  {
    brand: brand,
    name: 'VERSA',
    market_price: 270_000
  },
  {
    brand: brand,
    name: 'MURANO',
    market_price: 200_000
  }
].each do |vehicle_model|
  VehicleModel.create(vehicle_model)
end

kicks = VehicleModel.find_by name: 'KICKS'
sonic = VehicleModel.find_by name: 'SONIC'
golf = VehicleModel.find_by name: 'GOLF'

[
  {
    model: kicks,
    year: 2020,
    mileage: 20_000,
    listed_price: 100_000
  },
  {
    model: sonic,
    year: 2021,
    mileage: 20_000,
    listed_price: 100_000
  },
  {
    model: golf,
    year: 2018,
    mileage: 20_000,
    listed_price: 100_000
  }
].each do |vehicle|
  Vehicle.create vehicle
end
