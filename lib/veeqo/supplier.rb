module Veeqo
  class Supplier < Base
    include Veeqo::Actions::List

    def find(supplier_id)
      find_resource(supplier_id)
    end

    def create(name:)
      create_resource(name: name)
    end

    def update(supplier_id, attributes)
      update_resource(supplier_id, attributes)
    end

    def delete(supplier_id)
      delete_resource(supplier_id)
    end

    private

    def end_point
      "suppliers"
    end
  end
end
