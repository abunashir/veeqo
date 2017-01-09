module Veeqo
  module Actions
    module Find
      def find(resource_id)
        Veeqo.get_resource(
          [end_point, resource_id].join("/"),
        )
      end
    end
  end
end
