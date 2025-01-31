# frozen_string_literal: true

RSpec.describe CryptoTracker::Client do
  describe '.get' do
    it 'makes an HTTP request and returns JSON' do
      fake_response = double('response', body: '{"market_data": {"current_price": {"usd": 3000}}}')
      allow(Faraday).to receive(:get).and_return(fake_response)

      response = CryptoTracker::Client.get('coins/bitcoin')

      expect(response).to eq({ 'market_data' => { 'current_price' => { 'usd' => 3000 } } })
    end

    it 'handles request errors and returns an error hash' do
      allow(Faraday).to receive(:get).and_raise(StandardError.new('Falha na API'))

      response = CryptoTracker::Client.get('coins/bitcoin')

      expect(response).to eq({ error: 'Falha na API' })
    end
  end
end
