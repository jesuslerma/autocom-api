# frozen_string_literal: true

require 'rails_helper'

RSpec.describe VehicleModel, type: :model do
  it 'belongs to brand' do
    model = VehicleModel.reflect_on_association(:brand)
    expect(model.macro).to eq(:belongs_to)
  end

  it 'has many vehicles' do
    model = VehicleModel.reflect_on_association(:vehicles)
    expect(model.macro).to eq(:has_many)
  end
end
