require "net/http"
require "veeqo/response"
require "veeqo/configuration"

module Veeqo
  class Request
    def initialize(http_method, path, attributes = {})
      @path = path
      @http_method = http_method
      @attributes = attributes
    end

    def run
      Response.new(send_http_request).parse
    end

    private

    attr_reader :http_method, :attributes

    def send_http_request
      Net::HTTP.start(*net_http_options) do |http|
        http.request(build_net_http_request)
      end
    end

    def net_http_options
      [uri.host, uri.port, use_ssl: true]
    end

    def build_net_http_request
      request = constantize_net_http_class.new(uri)
      set_request_headers!(request)
      set_request_body!(request)
      request
    end

    def uri
      @uri ||= URI::HTTPS.build(
        host: Veeqo.configuration.api_host,
        path: ["", @path].join("/").squeeze("/"),
      )
    end

    def constantize_net_http_class
      Object.const_get("Net::HTTP::#{http_method.to_s.capitalize}")
    end

    def set_request_body!(request)
      request.body = attributes.to_json
    end

    def set_request_headers!(request)
      request.initialize_http_header "Content-Type" => "application/json"
      request.initialize_http_header "x-api-key" => Veeqo.configuration.api_key
    end
  end

  def self.get_resource(end_point, attributes = {})
    Request.new(:get, end_point, attributes).run
  end

  def self.post_resource(end_point, attributes)
    Request.new(:post, end_point, attributes).run
  end

  def self.put_resource(end_point, attributes)
    Request.new(:put, end_point, attributes).run
  end

  def self.delete_resource(end_point, resource_id)
    Request.new(:delete, [end_point, resource_id].join("/")).run
  end
end
