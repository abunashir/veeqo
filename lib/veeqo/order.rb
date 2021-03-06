module Veeqo
  class Order < Base
    include Veeqo::Actions::Base

    def create(channel_id:, customer_id:, delivery_method_id:, **attributes)
      required_attributes = {
        channel_id: channel_id,
        customer_id: customer_id,
        delivery_method_id: delivery_method_id,
      }

      create_resource(order: required_attributes.merge(attributes))
    end

    def update(order_id, attributes = {})
      update_resource(order_id, attributes)
    end

    private

    def end_point
      "orders"
    end
  end
end
