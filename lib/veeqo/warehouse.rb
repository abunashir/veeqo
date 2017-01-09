module Veeqo
  class Warehouse < Base
    def list(filters = {})
      list_resource(filters)
    end

    private

    def end_point
      "warehouses"
    end
  end
end
