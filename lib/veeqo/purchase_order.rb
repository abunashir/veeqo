module Veeqo
  class PurchaseOrder < Base
    def list(filters = {})
      list_resource(filters)
    end

    private

    def end_point
      "purchase_orders"
    end
  end
end
