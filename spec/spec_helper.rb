require "webmock/rspec"
$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "veeqo"

Dir["./spec/support/**/*.rb"].sort.each { |file| require file }

RSpec.configure do |config|
  config.before :suite do
    Veeqo.configure do |veeqo_config|
      veeqo_config.api_key = "SECRET_API_KEY"
    end

    config.include FakeVeeqoApi
  end
end
