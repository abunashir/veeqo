module Veeqo
  class Supplier < Base
    def list(filters = {})
      list_resource(filters)
    end

    private

    def end_point
      "suppliers"
    end
  end
end
