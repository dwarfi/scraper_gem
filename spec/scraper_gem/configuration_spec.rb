require 'spec_helper'

module ScraperGem
  RSpec.describe Configuration do
    let(:config) { Class.new(Configuration).instance }

    context 'default configuration' do
      it 'provides a default domain' do
        expect(config.domain).to eq('http://2a4dee9e.ngrok.io')
      end

      it 'provides a default open_timeout' do
        expect(config.open_timeout).to eql(30.0)
      end

      it 'provides a default read_timeout' do
        expect(config.read_timeout).to eql(30.0)
      end

      it 'provides a default connection_pool_size' do
        expect(config.connection_pool_size).to eql(10)
      end

      it 'provides a default connection_pool_timeout' do
        expect(config.connection_pool_timeout).to eql(60)
      end
    end

    describe 'custom configuration' do
      before do
        config.domain = 'https://something.else'
        config.open_timeout = 1.5
        config.read_timeout = 1
        config.connection_pool_size = 5
        config.connection_pool_timeout = 10
      end

      it 'returns the configured domain' do
        expect(config.domain).to eql('https://something.else')
      end

      it 'returns the configured open_timeout' do
        expect(config.open_timeout).to eql(1.5)
      end

      it 'returns the configured read_timeout' do
        expect(config.read_timeout).to eql(1.0)
      end

      it 'returns the configured connection_pool_size' do
        expect(config.connection_pool_size).to eql(5)
      end

      it 'returns the configured connection_pool_timeout' do
        expect(config.connection_pool_timeout).to eql(10)
      end
    end
  end
end
