# frozen_string_literal: true

class VehicleModelsController < BaseController
  def create
    @vehicle_model = Vehicles::Models::CreateVehicleModel.call(vehicle_model_params)

    if @vehicle_model.errors.present?
      render json: @vehicle_model.errors, status: :unprocessable_entity
    else
      render json: @vehicle_model, status: :created
    end
  end

  private

  def vehicle_model_params
    params.permit(:name, :brand, :market_price)
  end
end
