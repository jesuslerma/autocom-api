# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Vehicles::Models::CreateVehicleModel, type: :model do
  let(:valid_model_attributes) { { name: 'Golf', brand: 'VW', market_price: '90000' } }
  describe 'validations' do
    subject { Vehicles::Models::CreateVehicleModel.new(valid_model_attributes) }

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:brand_name) }
    it { should validate_presence_of(:market_price) }
  end
end
