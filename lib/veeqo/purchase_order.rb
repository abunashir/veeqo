module Veeqo
  class PurchaseOrder < Base
    include Veeqo::Actions::List

    private

    def end_point
      "purchase_orders"
    end
  end
end
