# frozen_string_literal: true

class Vehicle < ApplicationRecord
  belongs_to :model
  has_many :ratings, dependent: :destroy
end
