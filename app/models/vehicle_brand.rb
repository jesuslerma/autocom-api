# frozen_string_literal: true

class VehicleBrand < ApplicationRecord
  has_many :models, dependent: :destroy
end
