# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FinalMarketPrice::Calculator, type: :model do
  let(:brand) { create(:vehicle_brand) }
  let(:model) { create(:vehicle_model, brand: brand) }
  let(:vehicle) { create(:vehicle, model: model) }

  describe 'validations' do
    subject { FinalMarketPrice::Calculator.new(vehicle) }
    it { should validate_presence_of(:vehicle) }
  end

  describe 'create_vehicle_rating' do
    let(:calculator) { FinalMarketPrice::Calculator.new(vehicle) }
    before do
      calculator.final_market_price = 100
      calculator.rating = :good
    end

    it 'should create a VehicleRating' do
      result = calculator.create_vehicle_rating
      expect(result.vehicle).to eql(calculator.vehicle)
      expect(result.rating).to eql(calculator.rating.to_s)
      expect(result.price).to eql(calculator.final_market_price)
    end
  end

  describe 'calc_final_market_price' do
    context 'when the mileage is greather than max_mileage' do
      let(:model) { create(:vehicle_model, brand: brand, market_price: 100_000) }
      let(:vehicle) { create(:vehicle, model: model) }
      let(:calculator) { FinalMarketPrice::Calculator.new(vehicle) }

      it 'should apply 15% and 20% percentage' do
        final_market_price = calculator.calc_final_market_price
        expect(final_market_price).to eql(100_000-15_000-20_000)
      end
    end

    context 'when the mileage is lesser than max_mileage' do
      let(:model) { create(:vehicle_model, brand: brand, market_price: 100_000) }
      let(:vehicle) { create(:vehicle, model: model, mileage: 15_000) }
      let(:calculator) { FinalMarketPrice::Calculator.new(vehicle) }
      it 'should apply 15% percentage' do
        final_market_price = calculator.calc_final_market_price
        expect(final_market_price).to eql(100_000-15_000)
      end
    end

    context 'when the mileage is equals than max_mileage' do
      let(:model) { create(:vehicle_model, brand: brand, market_price: 100_000) }
      let(:vehicle) { create(:vehicle, model: model, mileage: 20_000) }
      let(:calculator) { FinalMarketPrice::Calculator.new(vehicle) }
      it 'should apply 15% percentage' do
        final_market_price = calculator.calc_final_market_price
        expect(final_market_price).to eql(100_000-15_000)
      end
    end
  end
end
