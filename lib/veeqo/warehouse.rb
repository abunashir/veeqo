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

    def update(warehouse_id, attributes)
      update_resource(warehouse_id, attributes)
    end

    def delete(warehouse_id)
      delete_resource(warehouse_id)
    end

    private

    def end_point
      "warehouses"
    end
  end
end
