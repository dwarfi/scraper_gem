require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/support/fixtures/vcr/cassettes'
  config.hook_into :webmock
  config.default_cassette_options = {
    erb: true,
    match_requests_on: %i{ method uri host path body },
  }
  config.configure_rspec_metadata!
end
