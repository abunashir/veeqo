require "json"

module Veeqo
  class Response
    attr_reader :response

    def initialize(response)
      @response = response
    end

    def parse
      JSON.parse(response, object_class: ResponseObject)
    rescue JSON::ParserError => error
      ResponseObject.new(error: error, content: "")
    end
  end

  class ResponseObject < OpenStruct; end
end
