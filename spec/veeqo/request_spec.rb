require "spec_helper"

RSpec.describe Veeqo::Request do
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

  describe ".put_resource" do
    it "submit the resource via :put" do
      stub_put_ping_request
      resource = Veeqo.put_resource("ping", data: "ping")

      expect(resource.data).to eq("Pong!")
    end
  end

  describe ".delete_resource" do
    it "submits the requests via :delete" do
      stub_delete_ping_request
      resource = Veeqo.delete_resource("ping", 1)

      expect(resource.successful?).to be_truthy
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

  def stub_put_ping_request
    stub_api_response(
      :put, "ping", status: 204, filename: "ping", data: { data: "ping" }
    )
  end

  def stub_delete_ping_request
    stub_api_response(
      :delete, "ping/1", status: 204, filename: "empty"
    )
  end
end
