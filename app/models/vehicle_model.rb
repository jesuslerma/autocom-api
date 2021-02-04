# frozen_string_literal: true

class VehicleModel < ApplicationRecord
  belongs_to :brand
  has_many :vehicles, dependent: :destroy
end
