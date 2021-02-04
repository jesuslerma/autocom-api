# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Vehicles::Models::CreateVehicle, type: :model do
  let(:valid_model_attributes) { { model: 'Golf', brand: 'VW', price: '90000', year: '2020' } }
  describe 'validations' do
    subject { Vehicles::Models::CreateVehicle.new(valid_model_attributes) }

    it { should validate_presence_of(:vehicle_model_name) }
    it { should validate_presence_of(:brand_name) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:year) }
  end
end
