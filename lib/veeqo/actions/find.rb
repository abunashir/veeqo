require "veeqo/request"

module Veeqo
  module Actions
    module Find
      def find(resource_id)
        Veeqo::Request.new(:get, [end_point, resource_id].join("/")).run
      end
    end
  end
end
