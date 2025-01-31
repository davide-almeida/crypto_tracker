# frozen_string_literal: true

require 'crypto_tracker/version'
require 'crypto_tracker/client'
require 'crypto_tracker/crypto'

module CryptoTracker
  SUPPORTED_CURRENCIES = %w[usd brl].freeze

  def self.price(coin, currency = 'usd')
    Crypto.new(coin, currency).current_price
  end

  def self.history(coin, days = 30, currency = 'usd')
    Crypto.new(coin, currency).price_history(days)
  end

  def self.supported_coins
    response = Client.get('coins/list')

    unless response.is_a?(Array)
      puts "Erro ao buscar criptomoedas: #{response}"
      return []
    end

    response.map { |coin| coin['id'] }
  end
end
