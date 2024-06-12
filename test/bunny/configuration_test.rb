require "test_helper"

class ConfigurationTest < Minitest::Test
  def setup
    Bunny.config.api_token = "abc123"
  end

  def test_api_token
    assert_equal "abc123", Bunny.config.api_token
  end
end
