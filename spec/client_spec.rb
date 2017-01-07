require "spec_helper"

RSpec.describe Veeqo::Client do
  describe ".get_resource" do
    it "retrieve the resource via :get" do
      stub_get_ping_request
      resource = Veeqo.get_resource("ping")

      expect(resource.data).to eq("Pong!")
    end
  end

  describe ".post_resource" do
    it "submits the resource via :get" do
      stub_post_ping_request
      resource = Veeqo.post_resource("ping", data: "ping")

      expect(resource.data).to eq("Pong!")
    end
  end

  def stub_get_ping_request
    stub_api_response(
      :get, "ping", status: 200, filename: "ping"
    )
  end

  def stub_post_ping_request
    stub_api_response(
      :post, "ping", status: 200, filename: "ping", data: { data: "ping" }
    )
  end
end
