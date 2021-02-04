# frozen_string_literal: true

class Vehicle < ApplicationRecord
  belongs_to :model, class_name: 'VehicleModel'
  has_many :ratings, dependent: :destroy, class_name: 'VehicleRating', foreign_key: 'vehicle_id'
end
