# frozen_string_literal: true

require 'rails_helper'

RSpec.describe VehicleRating, type: :model do
  it 'belongs to vehicle' do
    model = VehicleRating.reflect_on_association(:vehicle)
    expect(model.macro).to eq(:belongs_to)
  end
end
