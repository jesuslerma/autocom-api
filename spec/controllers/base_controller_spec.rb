# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BaseController, type: :controller do
  let(:token) { 'TEST123' }
  let(:headers) { { Authorization: "Token token=#{token}" } }

  describe 'handling access denied' do
    controller do
      def index; end
    end

    it 'returns error' do
      request.headers
      get :index
      expect(response.status).to(eq(401))
    end
  end

  describe 'handling access denied' do
    controller do
      def index; end
    end

    it 'returns error' do
      request.headers.merge!(headers)
      get :index
      expect(response.status).to(eq(204))
    end
  end
end
