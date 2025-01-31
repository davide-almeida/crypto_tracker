# frozen_string_literal: true

module CryptoTracker
  class Crypto
    attr_reader :coin, :currency

    def initialize(coin, currency)
      @coin = coin.downcase
      @currency = currency.downcase

      validate_inputs
    end

    def current_price
      response = Client.get("coins/#{coin}")
      price = response.dig('market_data', 'current_price', currency)

      return { error: 'Preço não disponível' } unless price

      { coin: coin, price: price, currency: currency, timestamp: Time.now }
    end

    def price_history(days)
      response = Client.get("coins/#{coin}/market_chart", { vs_currency: currency, days: days })

      return { error: 'Histórico não disponível' } unless response['prices']

      response['prices'].map do |price_data|
        { timestamp: Time.at(price_data[0] / 1000), price: price_data[1] }
      end
    end

    private

    def validate_inputs
      unless CryptoTracker.supported_coins.include?(coin)
        raise ArgumentError, "Moeda '#{coin}' não é suportada pela API CoinGecko."
      end

      return if CryptoTracker::SUPPORTED_CURRENCIES.include?(currency)

      raise ArgumentError,
            "Moeda '#{currency}' não é suportada. Opções: #{CryptoTracker::SUPPORTED_CURRENCIES.join(", ")}"
    end
  end
end
