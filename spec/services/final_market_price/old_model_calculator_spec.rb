# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FinalMarketPrice::Calculator, type: :model do
  let(:brand) { create(:vehicle_brand) }
  let(:model) { create(:vehicle_model, brand: brand) }
  let(:vehicle) { create(:vehicle, model: model, year: 2018) }
  let(:calculator) { FinalMarketPrice::Calculator.new(vehicle) }

  describe 'calc_final_market_price_for_old_models' do
    context 'when the vehicle is having a high mileage' do
      let(:calculator) { FinalMarketPrice::Calculator.new(vehicle) }
      it 'should apply 15% and 20% percentage' do
        final_market_price = calculator.calc_final_market_price_for_old_models
        expected_year_deprecation_cost = 18_000
        expected_mileage_deprecation_cost = 20_000
        market_price = vehicle.model.market_price
        expect(final_market_price).to eql(market_price - expected_year_deprecation_cost - expected_mileage_deprecation_cost)
      end
    end

    context 'when the vehicle is having a low mileage' do
      let(:vehicle) { create(:vehicle, model: model, year: 2018, mileage: 5_000) }
      let(:calculator) { FinalMarketPrice::Calculator.new(vehicle) }
      it 'should not apply deprecation' do
        final_market_price = calculator.calc_final_market_price_for_old_models
        expected_year_deprecation_cost = 18_000
        expected_mileage_deprecation_cost = 0
        market_price = vehicle.model.market_price
        expect(final_market_price).to eql(market_price - expected_year_deprecation_cost - expected_mileage_deprecation_cost)
      end
    end

    context 'when the vehicle is having a low mileage greather than min' do
      let(:vehicle) { create(:vehicle, model: model, year: 2018, mileage: 4_000) }
      let(:calculator) { FinalMarketPrice::Calculator.new(vehicle) }
      it 'should apply 15% and 20% percentage' do
        final_market_price = calculator.calc_final_market_price_for_old_models
        expected_year_deprecation_cost = 18_000
        expected_mileage_deprecation_cost = 1_000
        market_price = vehicle.model.market_price
        expect(final_market_price).to eql(market_price - expected_year_deprecation_cost + expected_mileage_deprecation_cost)
      end
    end
  end
end
