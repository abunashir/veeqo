module Veeqo
  class Order < Base
    def list(filters = {})
      Veeqo.get_resource("orders", filters)
    end

    def find(order_id)
      Veeqo.get_resource(
        ["orders", order_id].join("/"),
      )
    end

    def create(channel_id:, customer_id:, delivery_method_id:, **attrs)
      required_attributes = {
        channel_id: channel_id,
        customer_id: customer_id,
        delivery_method_id: delivery_method_id,
      }

      Veeqo.post_resource("orders", order: required_attributes.merge(attrs))
    end

    def update(order_id, attributes = {})
      Veeqo.put_resource(
        ["orders", order_id].join("/"), attributes
      )
    end

    def delete(order_id)
      Veeqo.delete_resource("orders", order_id)
    end
  end
end
