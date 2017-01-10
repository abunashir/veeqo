module Veeqo
  class DeliveryMethod < Base
    include Veeqo::Actions::Base

    def create(name:)
      create_resource(name: name)
    end

    def update(delivery_method_id, name:)
      update_resource(delivery_method_id, name: name)
    end

    private

    def end_point
      "delivery_methods"
    end
  end
end
