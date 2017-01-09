module Veeqo
  class Warehouse < Base
    def list(filters = {})
      list_resource(filters)
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
