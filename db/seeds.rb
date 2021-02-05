
# Vehicle Brands
["VW", "Chevrolet", "Nissan"].each do |name|
  VehicleBrand.create(name: name)
end

# VehicleModels
brand = VehicleBrand.find_by(name: "VW")
[
  {
    brand: brand,
    name: "JETTA",
    market_price: 300000
  },
  {
    brand: brand,
    name: "POLLO",
    market_price: 250000
  },
  {
    brand: brand,
    name: "GOLF",
    market_price: 270000
  },
  {
    brand: brand,
    name: "UP",
    market_price: 200000
  },
].each do |vehicle_model|
  VehicleModel.create(vehicle_model)
end

brand = VehicleBrand.find_by(name: "Chevrolet")
[
  {
    brand: brand,
    name: "TRAILBLAZER",
    market_price: 350000
  },
  {
    brand: brand,
    name: "SONIC",
    market_price: 250000
  },
  {
    brand: brand,
    name: "BOLT",
    market_price: 270000
  },
  {
    brand: brand,
    name: "BLAZER",
    market_price: 300000
  },
].each do |vehicle_model|
  VehicleModel.create(vehicle_model)
end
brand = VehicleBrand.find_by(name: "Nissan")
[
  {
    brand: brand,
    name: "KICKS",
    market_price: 300000
  },
  {
    brand: brand,
    name: "SENTRA",
    market_price: 250000
  },
  {
    brand: brand,
    name: "VERSA",
    market_price: 270000
  },
  {
    brand: brand,
    name: "MURANO",
    market_price: 200000
  },
].each do |vehicle_model|
  VehicleModel.create(vehicle_model)
end
