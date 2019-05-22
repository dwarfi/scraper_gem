require 'spec_helper'
require 'byebug'

module ScraperGem
  RSpec.describe Scraper do
    subject { described_class.new(params) }

    let(:params) do
      {
        index: 'ftse_100_ema_10_minute',
        start_date: '2019/05/01 10:10',
        end_date: '2019/05/01 10:20',
      }
    end

    let(:expected_response) { ::Scraper.expected_response }

    describe '#get' do
      it 'gets prices' do
        VCR.use_cassette('ScraperResponse') do
          expect(subject.get).to eq(expected_response)
        end
      end
    end
  end
end
