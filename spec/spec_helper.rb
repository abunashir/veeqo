require "webmock/rspec"
$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "veeqo"

RSpec.configure do |config|
  config.before :all do
    Veeqo.configure do |veeqo_config|
      veeqo_config.api_key = "SECRET_API_KEY"
    end
  end
end
