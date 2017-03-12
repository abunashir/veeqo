require "spec_helper"

RSpec.describe Veeqo::Request do
  describe "#run" do
    context "with 2xx response" do
      it "retrieves a resource via specified http verb" do
        stub_ping_request_via_get
        response = Veeqo::Request.new(:get, "ping").run

        expect(response.code.to_i).to eq(200)
      end
    end

    context "with 4xx, 5xx response" do
      it "raises the proper response error" do
        stub_invalid_ping_request_via_get
        request = Veeqo::Request.new(:get, "invalid")

        expect { request.run }.to raise_error(Veeqo::Errors::ServerError)
      end
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

  def stub_invalid_ping_request_via_get
    stub_api_response(:get, "invalid", status: 503, filename: "ping")
  end
end
