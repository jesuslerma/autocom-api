# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FinalMarketPrice::Calculator, type: :model do
  let(:brand) { create(:vehicle_brand) }
  let(:model) { create(:vehicle_model, brand: brand) }
  let(:vehicle) { build(:vehicle, model: model) }
  let(:calculator) { FinalMarketPrice::Calculator.new(vehicle) }

  describe 'validations' do
    subject { FinalMarketPrice::Calculator.new(vehicle) }
    it { should validate_presence_of(:vehicle) }
  end

  describe 'create_vehicle_rating' do
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

  describe 'calc_final_market_price_for_prev_recent_models' do
    context 'when the mileage is greather than max_mileage' do
      let(:vehicle) { build(:vehicle, model: model) }
      let(:calculator) { FinalMarketPrice::Calculator.new(vehicle) }
      it 'should apply 15% and 20% percentage' do
        final_market_price = calculator.calc_final_market_price_for_prev_recent_models
        expect(final_market_price).to eql(100_000 - 15_000 - 20_000)
      end
    end

    context 'when the mileage is lesser than max_mileage' do
      let(:model) { create(:vehicle_model, brand: brand) }
      let(:vehicle) { build(:vehicle, model: model, mileage: 15_000) }
      let(:calculator) { FinalMarketPrice::Calculator.new(vehicle) }
      it 'should apply 15% percentage' do
        final_market_price = calculator.calc_final_market_price_for_prev_recent_models
        expect(final_market_price).to eql(100_000 - 15_000)
      end
    end

    context 'when the mileage is equals than max_mileage' do
      let(:vehicle) { build(:vehicle, model: model, mileage: 20_000) }
      let(:calculator) { FinalMarketPrice::Calculator.new(vehicle) }
      it 'should apply 15% percentage' do
        final_market_price = calculator.calc_final_market_price_for_prev_recent_models
        expect(final_market_price).to eql(100_000 - 15_000)
      end
    end
  end

  describe 'vehicle_years' do
    it 'should return one year' do
      expect(calculator.vehicle_years).to eql(1)
    end
  end

  describe 'calc_year_deprecation' do
    it 'should return one year' do
      expect(calculator.calc_year_deprecation).to eql(16_000.00)
    end
  end

  describe 'calc_max_mileage' do
    it 'should return default max milleage' do
      expect(calculator.calc_max_mileage).to eql(20_000)
    end
  end

  describe 'mileage_deprecation_bonus' do
    context 'when the mileage is greather than min_milage' do
      let(:vehicle) { build(:vehicle, model: model, mileage: 20_000) }
      let(:calculator) { FinalMarketPrice::Calculator.new(vehicle) }
      it 'should subtract 2%' do
        expect(calculator.mileage_deprecation_bonus).to eql(0.02)
      end
    end

    context 'when the mileage is equals to min_milage' do
      let(:vehicle) { build(:vehicle, model: model, mileage: 5_000) }
      let(:calculator) { FinalMarketPrice::Calculator.new(vehicle) }
      it 'should subtract 0%' do
        expect(calculator.mileage_deprecation_bonus).to eql(0)
      end
    end

    context 'when the mileage is equals to min_milage' do
      let(:vehicle) { build(:vehicle, model: model, mileage: 3_000) }
      let(:calculator) { FinalMarketPrice::Calculator.new(vehicle) }
      it 'should add 1% bonus' do
        expect(calculator.mileage_deprecation_bonus).to eql(-0.01)
      end
    end
  end
end
