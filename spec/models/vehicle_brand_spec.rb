# frozen_string_literal: true

require 'rails_helper'

RSpec.describe VehicleBrand, type: :model do
  describe 'associations' do
    it { should have_many(:models).class_name('VehicleModel').with_foreign_key('brand_id') }
  end
end
