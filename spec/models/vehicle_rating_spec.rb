# frozen_string_literal: true

require 'rails_helper'

RSpec.describe VehicleRating, type: :model do
  describe 'associations' do
    it { should belong_to(:vehicle).class_name('Vehicle') }
  end

  describe 'enums' do
    it { should define_enum_for(:rating).with([:excellent, :good, :bad]) }
  end
end
