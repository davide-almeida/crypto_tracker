# frozen_string_literal: true

RSpec.describe CryptoTracker::Crypto do
  before do
    allow(CryptoTracker).to receive(:supported_coins).and_return(%w[bitcoin ethereum])
  end

  describe '#initialize' do
    it 'raises an error if the cryptocurrency is not supported' do
      expect { CryptoTracker::Crypto.new('dogecoin', 'usd') }.to raise_error(ArgumentError)
    end

    it 'raises an error if the fiat currency is not supported' do
      expect { CryptoTracker::Crypto.new('bitcoin', 'eur') }.to raise_error(ArgumentError)
    end
  end

  describe '#current_price' do
    it 'returns the cryptocurrency price' do
      fake_response = { 'market_data' => { 'current_price' => { 'usd' => 3000 } } }
      allow(CryptoTracker::Client).to receive(:get).and_return(fake_response)

      crypto = CryptoTracker::Crypto.new('bitcoin', 'usd')
      expect(crypto.current_price).to include(
        coin: 'bitcoin',
        price: 3000,
        currency: 'usd'
      )
      expect(crypto.current_price[:timestamp]).to be_a(Time)
    end
  end

  describe '#price_history' do
    it 'returns the cryptocurrency price history' do
      fake_response = { 'prices' => [[1_705_660_000_000, 3000], [1_705_670_000_000, 3100]] }
      allow(CryptoTracker::Client).to receive(:get).and_return(fake_response)

      crypto = CryptoTracker::Crypto.new('bitcoin', 'usd')
      history = crypto.price_history(2)

      expect(history.length).to eq(2)
      expect(history.first[:price]).to eq(3000)
      expect(history.last[:price]).to eq(3100)
    end
  end
end
