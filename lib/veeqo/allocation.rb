module Veeqo
  class Allocation < Base
    def create(order_id:, warehouse_id:, line_items:)
      @order_id = order_id
      create_resource(
        warehouse_id: warehouse_id,
        line_items_attributes: line_items,
      )
    end

    private

    def end_point
      ["orders", @order_id, "allocations"].compact.join("/")
    end
  end
end
