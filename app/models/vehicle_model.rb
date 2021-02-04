# frozen_string_literal: true

class VehicleModel < ApplicationRecord
  belongs_to :brand, class_name: 'VehicleBrand'
  has_many :vehicles, dependent: :destroy, foreign_key: 'model_id', inverse_of: :model
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :brand_id, presence: true
end
