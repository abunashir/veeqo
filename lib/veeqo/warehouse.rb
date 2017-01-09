module Veeqo
  class Warehouse < Base
    def list(filters = {})
      list_resource(filters)
    end

    def find(warehouse_id)
      find_resource(warehouse_id)
    end

    def create(name:)
      create_resource(name: name)
    end

    private

    def end_point
      "warehouses"
    end
  end
end
