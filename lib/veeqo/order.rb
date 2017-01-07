module Veeqo
  class Order
    def self.list(filters = {})
      Veeqo.get_resource("orders", filters)
    end
  end
end
