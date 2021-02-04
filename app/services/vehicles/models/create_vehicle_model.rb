# frozen_string_literal: true

module Vehicles
  module Models
    class CreateVehicleModel
      include ActiveModel::Validations
      attr_accessor :brand_name, :name, :market_price
      attr_reader :vehicle_model

      validates :brand_name, presence: true
      validates :name, presence: true
      validates :market_price, presence: true

      def initialize(params)
        @brand_name = params[:brand]
        @name = params[:name]
        @market_price = params[:market_price]
      end

      def self.call(...)
        new(...).call
      end

      def call
        return self unless valid?

        brand = find_or_create_brand
        @vehicle_model ||= create_vehicle_model(brand)
        self
      end

      private

      def create_vehicle_model(brand)
        VehicleModel.create(
          brand: brand,
          name: @name,
          market_price: @market_price.to_i
        )
      end

      def find_or_create_brand
        VehicleBrand.create_or_find_by(name: @brand_name)
      end
    end
  end
end
