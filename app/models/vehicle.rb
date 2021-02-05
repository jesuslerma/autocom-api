# frozen_string_literal: true

class Vehicle < ApplicationRecord
  belongs_to :model, class_name: 'VehicleModel'
  has_many :ratings, dependent: :destroy, class_name: 'VehicleRating'

  validates :year, presence: true
  validates :listed_price, presence: true
  validates :model_id, presence: true

  after_commit :calculate_final_market_price, on: :create

  def calculate_final_market_price
    calculator = FinalMarketPrice::Calculator.new(self)
    calculator.call
  end
end
