# frozen_string_literal: true

module RequestSpecHelper
  # Parse JSON response to ruby hash
  def json_response
    JSON.parse(response.body)
  end
end
