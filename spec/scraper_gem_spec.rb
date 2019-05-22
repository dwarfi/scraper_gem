require 'spec_helper'

RSpec.describe ScraperGem do
  describe '.configure' do
    it 'allows the configuration to be set' do
      ScraperGem.configure do |config|
        config.domain = 'a domain'
      end

      expect(ScraperGem::Configuration.instance.domain).to eq('a domain')
    end
  end
end
