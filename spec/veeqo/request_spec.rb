require "spec_helper"

RSpec.describe Veeqo::Request do
  describe "#run" do
    it "executes the http request with specified verb" do
      stub_ping_request_via_get
      response = Veeqo::Request.new(:get, "ping").run

      expect(response.code.to_i).to eq(200)
    end
  end

  describe "#parse" do
    it "runs the request and parse the response" do
      stub_ping_request_via_get
      response = Veeqo::Request.new(:get, "ping").parse

      expect(response.data).to eq("Pong!")
    end
  end

  def stub_ping_request_via_get
    stub_api_response(:get, "ping", status: 200, filename: "ping")
  end
end
