# frozen_string_literal: true

require "crypto_tracker/version"
require "crypto_tracker/client"
require "crypto_tracker/crypto"

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
