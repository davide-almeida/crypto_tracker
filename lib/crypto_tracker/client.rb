# frozen_string_literal: true

require "faraday"
require "json"

module CryptoTracker
  class Client
    BASE_URL = "https://api.coingecko.com/api/v3"

    def self.get(endpoint, params = {})
      response = Faraday.get("#{BASE_URL}/#{endpoint}", params)
      JSON.parse(response.body)
    rescue StandardError => e
      { error: e.message }
    end
  end
end
