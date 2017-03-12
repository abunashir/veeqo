require "net/http"
require "veeqo/errors"
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
      valid_response || raise_response_error
    end

    def parse
      Response.new(run).parse
    end

    private

    def valid_response
      if valid_response?
        response
      end
    end

    def raise_response_error
      raise response_error
    end

    def valid_response?
      response.is_a?(Net::HTTPSuccess)
    end

    def response
      @response ||= send_http_request
    rescue *server_errors => error
      @response ||= error
    end

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
      Object.const_get("Net::HTTP::#{@http_method.to_s.capitalize}")
    end

    def set_request_body!(request)
      request.body = @attributes.to_json
    end

    def set_request_headers!(request)
      request.initialize_http_header("Content-Type" => "application/json")
      request.initialize_http_header("x-api-key" => Veeqo.configuration.api_key)
    end

    def server_errors
      Veeqo::Errors.server_errors
    end

    def response_error
      Veeqo::Errors.error_klass_for(response)
    end
  end
end
