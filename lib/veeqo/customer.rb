module Veeqo
  class Customer < Base
    def list(filters = {})
      list_resource(filters)
    end

    private

    def end_point
      "customers"
    end
  end
end
