module Veeqo
  class DeliveryMethod < Base
    include Veeqo::Actions::List

    private

    def end_point
      "delivery_methods"
    end
  end
end
