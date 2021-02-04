# frozen_string_literal: true

class VehicleRating < ApplicationRecord
  belongs_to :vehicle
  enum rating: { excellent: 0, good: 1, bad: 2 }
end
