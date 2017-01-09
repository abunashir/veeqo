module Veeqo
  module Actions
    module List
      def list(filters = {})
        Veeqo.get_resource(end_point, filters)
      end
    end
  end
end
