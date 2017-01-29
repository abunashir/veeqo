module Veeqo
  class Allocation < Base
    include Veeqo::Actions::Delete

    def create(order_id:, warehouse_id:, line_items:)
      @order_id = order_id
      create_resource(
        warehouse_id: warehouse_id,
        line_items_attributes: line_items,
      )
    end

    def update(allocation_id, order_id:, line_items:, **attributes)
      @order_id = order_id
      update_resource(
        allocation_id,
        attributes.merge(line_items_attributes: line_items),
      )
    end

    def delete(order_id, allocation_id)
      @order_id = order_id
      super(allocation_id)
    end

    private

    def end_point
      ["orders", @order_id, "allocations"].compact.join("/")
    end
  end
end
