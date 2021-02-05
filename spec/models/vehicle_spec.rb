# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  describe 'associations' do
    it { should belong_to(:model).class_name('VehicleModel') }
    it { should have_one(:rating).class_name('VehicleRating') }
  end

  describe 'validations' do
    subject { build(:vehicle) }
    it { should validate_presence_of(:year) }
    it { should validate_presence_of(:listed_price) }
    it { should validate_presence_of(:model_id) }
  end
end
