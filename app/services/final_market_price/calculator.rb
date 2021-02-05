# frozen_string_literal: true

#
# From Vehicle: `list_price`, `mileage` and `year`
#- From VehicleModel : `market_price`
#- Maximun Mileage: `max_mileage = 20.000`
#- Year Depreciation: `15%`
#
module FinalMarketPrice
  class Calculator
    include ActiveModel::Validations
    attr_accessor :vehicle, :final_market_price, :rating

    validates :vehicle, presence: true

    def initialize(vehicle)
      @vehicle = vehicle
      @final_market_price = 0
      @list_price = @vehicle.listed_price
      @mileage = @vehicle.mileage
      @year = @vehicle.year
      @market_price = @vehicle.model.market_price
      @max_mileage = 20_000
      @year_deprecation = 0.15
      @model = vehicle.model
    end

    def self.call(...)
      new(...).call
    end

    def call
      @final_market_price = calc_final_market_price
      @rating = :excellent if excellent_rating?
      @rating = :good if good_rating?
      @rating = :bad if bad_rating?

    end

    def create_vehicle_rating
      VehicleRating.create(
        vehicle: @vehicle,
        rating: @rating,
        price: @final_market_price
      )
    end

    def calc_final_market_price
      year_deprecation_cost = @market_price * @year_deprecation 
      mileage_deprecation_cost = @market_price * mileage_deprecation
      ((@market_price - year_deprecation_cost) - mileage_deprecation_cost).to_i
    end

    private

    def mileage_deprecation
      return 0.20 if apply_deprecation?
      0.0
    end

    def apply_deprecation?
      @mileage > @max_mileage
    end

    def excellent_rating?; end

    def good_rating?; end

    def bad_rating?; end
  end
end
