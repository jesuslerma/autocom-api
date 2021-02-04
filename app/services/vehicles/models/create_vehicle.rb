# frozen_string_literal: true

module Vehicles
  module Models
    class CreateVehicle
      include ActiveModel::Validations
      attr_accessor :brand_name, :vehicle_model_name, :year, :price
      attr_reader :vehicle

      validates :brand_name, presence: true
      validates :vehicle_model_name, presence: true
      validates :year, presence: true
      validates :price, presence: true

      def initialize(params)
        @brand_name = params[:brand]
        @vehicle_model_name = params[:model]
        @year = params[:year]
        @price = params[:price]
      end

      def self.call(...)
        new(...).call
      end

      def call
        return self unless valid?

        model ||= find_model
        raise ActiveRecord::RecordNotFound unless model # TODO: improve message error
        raise ActiveRecord::RecordNotFound unless model_is_in_brand?(model) # TODO: improve message

        @vehicle ||= create_vehicle(model)
        self
      end

      private

      def create_vehicle(model)
        Vehicle.create(
          year: @year.to_i,
          listed_price: @price.to_i,
          model: model
        )
      end

      def find_model
        VehicleModel.find_by name: @vehicle_model_name
      end

      def model_is_in_brand?(model)
        model.brand.name == @brand_name
      end
    end
  end
end
