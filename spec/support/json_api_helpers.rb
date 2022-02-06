# frozen_string_literal: true

module JsonApiHelpers
  def json
    JSON.parse(response.body)
  end

  def json_s
    json.deep_symbolize_keys
  end
end
