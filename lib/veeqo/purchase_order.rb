module Veeqo
  class PurchaseOrder < Base
    def list(filters = {})
      Veeqo.get_resource("purchase_orders", filters)
    end
  end
end
