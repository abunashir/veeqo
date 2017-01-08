require "json"

module Veeqo
  class Response
    attr_reader :response

    def initialize(response)
      @response = response
    end

    def parse
      parse_response_content
    rescue JSON::ParserError => error
      ResponseObject.new(error: error, content: "")
    end

    private

    def parse_response_content
      if response.code == 204
        ResponseObject.new(successful?: true, content: "")
      else
        JSON.parse(response, object_class: ResponseObject)
      end
    end
  end

  class ResponseObject < OpenStruct; end
end
