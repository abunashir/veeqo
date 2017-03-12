module Veeqo
  module Errors
    class Unauthorized < RequestError
      def explanation
        "A request to Veeqo API was sent without a valid authentication"
      end
    end
  end
end
