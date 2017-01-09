module Veeqo
  module Actions
    module Delete
      def delete(resource_id)
        Veeqo.delete_resource(end_point, resource_id)
      end
    end
  end
end
