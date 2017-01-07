module Veeqo
  class Order
    def self.list(filters = {})
      Veeqo.get_resource("orders", filters)
    end

    def self.create(channel_id:, customer_id:, delivery_method_id:, **attrs)
      required_attributes = {
        channel_id: channel_id,
        customer_id: customer_id,
        delivery_method_id: delivery_method_id,
      }

      Veeqo.post_resource("orders", order: required_attributes.merge(attrs))
    end
  end
end
