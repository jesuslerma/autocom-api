# frozen_string_literal: true

require 'rails_helper'

RSpec.describe VehicleModel, type: :model do
  describe 'associations' do
    it { should belong_to(:brand).class_name('VehicleBrand') }
    it { should have_many(:vehicles).class_name('Vehicle').with_foreign_key('model_id') }
  end

  describe 'validations' do
    subject { build(:vehicle_model) }
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:brand_id) }
  end
end
