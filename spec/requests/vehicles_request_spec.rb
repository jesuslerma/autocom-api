# frozen_string_literal: true

require 'rails_helper'
RSpec.describe 'Vehicles', type: :request do
  describe 'POST /vehicles' do
    let(:token) { 'TEST123' }
    let(:headers)  { { Authorization: "Token token=#{token}" } }
    let(:brand) { create :vehicle_brand }
    let(:model) { create :vehicle_model, brand: brand }
    let(:valid_vehicles_attributes) { { brand: brand.name, model: model.name, year: '2020', price: '100000' } }
    let(:invalid_vehicles_attributes) { { brand: brand.name, model: model.name, year: '', price: '' } }

    context 'when all required attributes are present' do
      before do 
        post '/vehicles', params: valid_vehicles_attributes, headers: headers
      end

      it 'returns the vehicle' do
        expect(json_response).not_to be_empty
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when one required attribute is missing' do
      before { post '/vehicles', params: invalid_vehicles_attributes, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end
  end
end
