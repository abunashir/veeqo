module Veeqo
  module Errors
    class RequestError < StandardError
      def message
        explanation
      end

      def explanation
        "A request to Veeqo API failed"
      end
    end
  end

  Error = Errors::RequestError
end
