module Veeqo
  class Supplier < Base
    def list(filters = {})
      list_resource(filters)
    end

    def find(supplier_id)
      find_resource(supplier_id)
    end

    def create(name:)
      create_resource(name: name)
    end

    private

    def end_point
      "suppliers"
    end
  end
end
