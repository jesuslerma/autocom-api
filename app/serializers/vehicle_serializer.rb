class VehicleSerializer < ActiveModel::Serializer
  attributes :id, :model_name, :brand_name, :year, :mileage, :final_market_price, :list_price, :rating

  def model_name
    object.model.name
  end

  def list_price
    object.listed_price
  end

  def brand_name
    object.model.brand.name
  end

  def rating
    object.rating.rating
  end
end
