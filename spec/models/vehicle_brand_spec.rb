# frozen_string_literal: true

require 'rails_helper'

RSpec.describe VehicleBrand, type: :model do
  it 'has many models' do
    brand = VehicleBrand.reflect_on_association(:models)
    expect(brand.macro).to eq(:has_many)
  end
end
