require "spec_helper"

RSpec.describe Veeqo::Configuration do
  describe ".configuration" do
    it "returns the client configuration object" do
      veeqo_api_host = "api.veeqo.com"
      configuration = Veeqo.configuration

      expect(configuration.api_host).to eq(veeqo_api_host)
    end
  end

  describe ".configure" do
    it "allows user to cofigure their keys" do
      veeqo_api_key = "VEEQO_API_KEY"

      Veeqo.configure do |config|
        config.api_key = veeqo_api_key
      end

      expect(Veeqo.configuration.api_key).to eq(veeqo_api_key)
    end
  end
end
