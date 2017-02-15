require "spec_helper"

RSpec.describe Veeqo::Request do
  describe "#run" do
    it "retrieves the parsed resource in specified http verb" do
      stub_ping_request_via_get
      response = Veeqo::Request.new(:get, "ping").run

      expect(response.data).to eq("Pong!")
    end
  end

  def stub_ping_request_via_get
    stub_api_response(:get, "ping", status: 200, filename: "ping")
  end
end
