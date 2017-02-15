require "json"

module Veeqo
  class Response
    attr_reader :response

    def initialize(response)
      @response = response
    end

    def parse
      parse_response_content
    end

    private

    def parse_response_content
      JSON.parse(response.body || "{}", object_class: ResponseObject)
    end
  end

  class ResponseObject < OpenStruct
    def successful?
      true
    end
  end
end
