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

    CURRENT_YEAR = 2021

    def initialize(vehicle)
      @vehicle = vehicle
      @final_market_price = 0
      @list_price = @vehicle.listed_price || 0
      @mileage = @vehicle.mileage || 0
      @year = @vehicle.year
      @market_price = @vehicle.model.market_price || 0
      @max_mileage = 20_000
      @min_mileage = 5_000 # I put this information, but this information is missing from the quiz
      @year_deprecation = 0.15
      @model = vehicle.model
    end

    def self.call(...)
      new(...).call
    end

    def call
      if CURRENT_YEAR - @year >= 2020
        @final_market_price = calc_final_market_price_for_prev_recent_models
      else
        @final_market_price = calc_final_market_price_for_old_models
      end
      update_vehicle_final_market_price
      @rating = :excellent if excellent_rating?
      @rating = :good if good_rating?
      @rating = :bad if bad_rating?
      create_vehicle_rating
    end
    
    # TODO add test
    def update_vehicle_final_market_price
      @vehicle.final_market_price = @final_market_price
      # @vehicle.save validate with callback
    end

    def create_vehicle_rating
      VehicleRating.create(
        vehicle: @vehicle,
        rating: @rating,
        price: @final_market_price
      )
    end

    def calc_final_market_price_for_prev_recent_models
      year_deprecation_cost = @market_price * @year_deprecation
      mileage_deprecation_cost = @market_price * mileage_deprecation(@max_mileage)
      ((@market_price - year_deprecation_cost) - mileage_deprecation_cost).to_i
    end

    def calc_final_market_price_for_old_models
      if high_mileage?
        year_deprecation_cost = calc_year_deprecation
        max_mileage = calc_max_mileage
        mileage_deprecation_cost = @market_price * mileage_deprecation(max_mileage)
        return ((@market_price - year_deprecation_cost) - mileage_deprecation_cost).to_i
      end

      if low_mileage?
        year_deprecation_cost = calc_year_deprecation
        max_mileage = calc_max_mileage
        mileage_deprecation_cost = @market_price * mileage_deprecation_bonus
        ((@market_price - year_deprecation_cost) - mileage_deprecation_cost).to_i
      end
    end

    def calc_year_deprecation
      @market_price * (@year_deprecation + (0.01 * vehicle_years))
    end

    def calc_max_mileage
      @max_mileage * vehicle_years
    end

    def calc_mileage_deprecation_bonus; end

    # TODO: probably we can move this to vehicle model
    def vehicle_years
      CURRENT_YEAR - @year
    end

    def mileage_deprecation_bonus
      return 0.02 if @mileage > @min_mileage
      return 0 if @mileage == @min_mileage
      return -0.01 if @mileage < @min_mileage
    end

    private

    def mileage_deprecation(max_mileage)
      return 0.20 if apply_prev_year_deprecation?(max_mileage)

      0.0
    end

    def apply_prev_year_deprecation?(max_mileage)
      @mileage > max_mileage
    end

    # TODO: we need to know what they means by  High Mileage:
    def high_mileage?
      @mileage > @max_mileage
    end

    # TODO: we need to know what they means by  Low Mileage:
    def low_mileage?
      @mileage < @max_mileage
    end

    def excellent_rating?
      @list_price > (@final_market_price * 0.80)
    end

    def good_rating?
      @list_price < (@final_market_price * 0.80) || @list_price  < (@final_market_price * 1.10)
    end

    def bad_rating?
      @list_price > (@final_market_price * 1.10)
    end
  end
end
