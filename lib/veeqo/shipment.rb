module Veeqo
  class Shipment < Base
    include Veeqo::Actions::Delete

    def create(order_id:, allocation_id:, shipment:)
      create_resource(
        order_id: order_id,
        allocation_id: allocation_id,
        shipment: reorganize_shipment(shipment),
      )
    end

    private

    def end_point
      "shipments"
    end

    def reorganize_shipment(carrier_id:, notify_customer:, **attributes)
      {
        carrier_id: carrier_id,
        notify_customer: notify_customer,
        update_remote_order: attributes.delete(:update_remote_order),
        tracking_number_attributes: {
          tracking_number: attributes.delete(:tracking_number),
        },
      }
    end
  end
end
