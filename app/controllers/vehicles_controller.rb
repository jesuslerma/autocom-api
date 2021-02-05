# frozen_string_literal: true

class VehiclesController < BaseController
  skip_before_action :authenticate, only: [:index]

  def create
    @vehicle = Vehicles::Models::CreateVehicle.call(vehicle_params)
    if @vehicle.errors.present?
      render json: {errors:  @vehicle.errors }, status: :unprocessable_entity
    else
      render json: @vehicle, status: :created
    end
  end

  def index
    render json: Vehicle.all, status: :ok
  end

  private

  def vehicle_params
    params.permit(:brand, :model, :year, :price)
  end
end
