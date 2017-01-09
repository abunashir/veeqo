module Veeqo
  class Store < Base
    include Veeqo::Actions::List
    include Veeqo::Actions::Find

    def create(name:, type_code:)
      create_resource(name: name, type_code: type_code)
    end

    def update(store_id, attributes)
      update_resource(store_id, attributes)
    end

    private

    def end_point
      "channels"
    end
  end
end
