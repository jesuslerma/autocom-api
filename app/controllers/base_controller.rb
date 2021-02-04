# frozen_string_literal: true

class BaseController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods
  TOKEN='TEST123'
  before_action :authenticate

  private
  def authenticate
    authenticate_or_request_with_http_token do |token|
      ActiveSupport::SecurityUtils.secure_compare(token, TOKEN)
    rescue StandardError
      render_unauthorized
    end
  end

  def render_unauthorized
    render(json: { errors: 'Unauthenticated!' }, status: :unauthorized)
  end
end
