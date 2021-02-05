# frozen_string_literal: true

class Vehicle < ApplicationRecord
  belongs_to :model, class_name: 'VehicleModel'
  has_one :rating, dependent: :destroy, class_name: 'VehicleRating'

  validates :year, presence: true
  validates :listed_price, presence: true
  validates :model_id, presence: true

  after_commit :calculate_final_market_price, on: :create

  def calculate_final_market_price
    calculator = FinalMarketPrice::Calculator.new(self)
    calculator.call
  end

  def self.search(params)
    @vehicles = all
    if params.include?(:year)
      @vehicles = @vehicles.where(year: params[:year])
    end

    if params.include?(:model_name)
      @vehicles = @vehicles.joins(:model).where('lower(vehicle_models.name) LIKE ?', "%#{params[:model_name].downcase}%")
    end


    if params.include?(:rating)
      rating = VehicleRating.ratings[params[:rating]]
      @vehicles = @vehicles.joins(:rating).where('vehicle_ratings.rating = ?', rating)
    end

    @vehicles
  end
end
