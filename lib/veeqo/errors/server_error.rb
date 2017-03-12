module Veeqo
  module Errors
    class ServerError < RequestError
      def explanation
        "A request to Veeqo API caused an unexpected server error"
      end
    end
  end
end
