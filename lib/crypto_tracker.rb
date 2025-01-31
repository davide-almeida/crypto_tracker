# frozen_string_literal: true

require_relative "crypto_tracker/version"
require_relative "crypto_tracker/client"
require_relative "crypto_tracker/crypto"

module CryptoTracker
  SUPPORTED_CURRENCIES = %w[usd brl].freeze
  SUPPORTED_COINS = %w[bitcoin ethereum].freeze

  def self.price(coin, currency = "usd")
    Crypto.new(coin, currency).current_price
  end

  def self.history(coin, days = 30, currency = "usd")
    Crypto.new(coin, currency).price_history(days)
  end
end
