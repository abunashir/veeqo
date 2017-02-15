require "veeqo/request"

module Veeqo
  module Actions
    module List
      def list(filters = {})
        Veeqo::Request.new(:get, end_point, filters).run
      end
    end
  end
end
