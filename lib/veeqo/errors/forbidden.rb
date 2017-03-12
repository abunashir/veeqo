module Veeqo
  module Errors
    class Forbidden < RequestError
      def explanation
        "A request to Veeqo API was considered forbidden by the server"
      end
    end
  end
end
