# frozen_string_literal: true

RSpec.describe CryptoTracker do
  describe '.price' do
    it 'calls Crypto.new and returns the current price' do
      crypto_instance = instance_double(CryptoTracker::Crypto, current_price: { price: 3000 })
      allow(CryptoTracker::Crypto).to receive(:new).and_return(crypto_instance)

      expect(CryptoTracker.price('bitcoin', 'usd')).to eq({ price: 3000 })
    end
  end

  describe '.history' do
    it 'calls Crypto.new and returns the price history' do
      history_data = [{ timestamp: Time.now, price: 3000 }]
      crypto_instance = instance_double(CryptoTracker::Crypto, price_history: history_data)
      allow(CryptoTracker::Crypto).to receive(:new).and_return(crypto_instance)

      expect(CryptoTracker.history('bitcoin', 7, 'usd')).to eq(history_data)
    end
  end

  describe '.supported_coins' do
    it 'returns a list of supported cryptocurrencies' do
      allow(CryptoTracker::Client).to receive(:get).with('coins/list').and_return([{ 'id' => 'bitcoin' },
                                                                                   { 'id' => 'ethereum' }])

      expect(CryptoTracker.supported_coins).to include('bitcoin', 'ethereum')
    end
  end
end
