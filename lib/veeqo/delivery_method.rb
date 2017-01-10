module Veeqo
  class DeliveryMethod < Base
    include Veeqo::Actions::List
    include Veeqo::Actions::Find

    def create(name:)
      create_resource(name: name)
    end

    private

    def end_point
      "delivery_methods"
    end
  end
end
