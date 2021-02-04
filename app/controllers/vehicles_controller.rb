# frozen_string_literal: true

class VehiclesController < BaseController
  def create
    @vehicle = Vehicles::Models::CreateVehicle.call(vehicle_params)
    if @vehicle.errors.present?
      render json: @vehicle.errors, status: :unprocessable_entity
    else
      render json: @vehicle, status: :created
    end
  end

  private

  def vehicle_params
    params.permit(:brand, :model, :year, :price)
  end
end
