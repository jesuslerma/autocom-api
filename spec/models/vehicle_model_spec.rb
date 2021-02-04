# frozen_string_literal: true

require 'rails_helper'

RSpec.describe VehicleModel, type: :model do
  describe 'associations' do
    it { should belong_to(:brand).class_name('VehicleBrand') }
    it { should have_many(:vehicles).class_name('Vehicle').with_foreign_key('model_id') }
  end
end
