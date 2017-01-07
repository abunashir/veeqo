require "rest-client"
require "veeqo/response"
require "veeqo/configuration"

module Veeqo
  class Client
    def initialize(http_method, end_point, attributes = {})
      @end_point = end_point
      @http_method = http_method
      @attributes = attributes
    end

    def execute
      Response.new(execute_request).parse
    end

    private

    attr_reader :http_method, :end_point, :attributes

    def execute_request
      RestClient::Request.execute(
        method: http_method,
        url: api_end_point,
        payload: attributes,
        headers: custom_api_headers,
      )
    end

    def api_end_point
      [Veeqo.configuration.api_host, end_point].join("/")
    end

    def custom_api_headers
      { "x-api-key" => Veeqo.configuration.api_key }
    end
  end

  def self.get_resource(end_point)
    Client.new(:get, end_point).execute
  end
end
