# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'VehicleModels', type: :request do
  describe 'POST /vehicle_models' do
    let(:token) { 'TEST123' }
    let(:headers) { { Authorization: "Token token=#{token}" } }
    let(:valid_model_attributes) { { name: 'Golf', brand: 'VW', market_price: '90000' } }
    let(:invalid_model_attributes) { { brand: 'VW', market_price: '90000' } }

    context 'when all required attributes are present' do
      before do
        post '/vehicle_models', params: valid_model_attributes, headers: headers
      end

      it 'returns the model' do
        expect(json_response).not_to be_empty
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when one required attribute is missing' do
      before { post '/vehicle_models', params: invalid_model_attributes, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end
  end
end
