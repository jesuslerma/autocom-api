# frozen_string_literal: true

class VehicleModel < ApplicationRecord
  belongs_to :brand, class_name: 'VehicleBrand'
  has_many :vehicles, dependent: :destroy, foreign_key: 'model_id'
end
