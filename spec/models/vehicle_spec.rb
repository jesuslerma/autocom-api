# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  it 'belongs to model' do
    model = Vehicle.reflect_on_association(:model)
    expect(model.macro).to eq(:belongs_to)
  end

  it 'has many ratings' do
    model = Vehicle.reflect_on_association(:ratings)
    expect(model.macro).to eq(:has_many)
  end
end
