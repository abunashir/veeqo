module Veeqo
  class Supplier < Base
    include Veeqo::Actions::List
    include Veeqo::Actions::Find
    include Veeqo::Actions::Delete

    def create(name:)
      create_resource(name: name)
    end

    def update(supplier_id, attributes)
      update_resource(supplier_id, attributes)
    end

    private

    def end_point
      "suppliers"
    end
  end
end
