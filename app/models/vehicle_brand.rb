# frozen_string_literal: true

class VehicleBrand < ApplicationRecord
  has_many :models, dependent: :destroy, foreign_key: 'brand_id', class_name: 'VehicleModel'
end
