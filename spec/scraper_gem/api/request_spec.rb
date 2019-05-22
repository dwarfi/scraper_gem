require 'spec_helper'

module ScraperGem
  module API
    RSpec.describe Request do
      subject {described_class.new(params)}

      describe '#parsed_response' do
        context 'successful' do
          let(:params) do
            {
              index: 'ftse_100_ema_10_minute',
              start_date: '2019/05/01 10:10',
              end_date: '2019/05/01 10:20',
            }
          end
          let(:expected_response) { ::Scraper.expected_response }

          it 'parses the response' do
            VCR.use_cassette('API_parsed_response') do
              expect(subject.parsed_response).to eq(expected_response)
            end
          end
        end

        context 'bad request' do
          let(:params) do
            {
              start_date: '2019/05/01 10:10',
              end_date: '2019/05/01 10:20',
            }

            it 'raises api error' do
              expect { response }.to raise_error(Request::ApiError)
            end
          end
        end
      end
    end
  end
end
