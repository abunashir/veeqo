module Veeqo
  class Warehouse < Base
    include Veeqo::Actions::Base

    def create(name:)
      create_resource(name: name)
    end

    def update(warehouse_id, attributes)
      update_resource(warehouse_id, attributes)
    end

    private

    def end_point
      "warehouses"
    end
  end
end
