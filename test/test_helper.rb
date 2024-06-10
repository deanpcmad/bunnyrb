$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "bunny"

require "minitest/autorun"
require "faraday"
require "json"
require "vcr"
require "dotenv/load"

VCR.configure do |config|
  config.cassette_library_dir = "test/vcr_cassettes"
  config.hook_into :faraday

  config.filter_sensitive_data("<AUTHORIZATION>") { ENV["API_KEY"] }
end

Bunny.configure do |config|
  config.api_token = ENV["API_KEY"]
end

class Minitest::Test

  def setup
    VCR.insert_cassette(name)
  end

  def teardown
    VCR.eject_cassette
  end

end
