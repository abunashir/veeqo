require "veeqo/request"

module Veeqo
  module Actions
    module Delete
      def delete(resource_id)
        Veeqo::Request.new(:delete, [end_point, resource_id].join("/")).run
      end
    end
  end
end
