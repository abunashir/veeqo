module Veeqo
  class Product
    def self.list(filters = {})
      Veeqo.get_resource("products", filters)
    end
  end
end
