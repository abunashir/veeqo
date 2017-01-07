require "spec_helper"

RSpec.describe Veeqo::Client do
  describe ".get_resource" do
    it "retrieve the resource via :get" do
      stub_get_ping_request
      resource = Veeqo.get_resource("ping")

      expect(resource.data).to eq("Pong!")
    end
  end

  def stub_get_ping_request
    stub_request(:get, "https://api.veeqo.com/ping").
      with(headers: { "X-Api-Key" => Veeqo.configuration.api_key }).
      to_return(status: 200, body: ping_response_body_in_json)
  end

  def ping_response_body_in_json
    JSON.generate(data: "Pong!")
  end
end
