# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  describe 'associations' do
    it { should belong_to(:model).class_name('VehicleModel') }
    it { should have_many(:ratings).class_name('VehicleRating') }
  end
end
