module Veeqo
  class Store < Base
    include Veeqo::Actions::List

    def create(name:, type_code:)
      create_resource(name: name, type_code: type_code)
    end

    private

    def end_point
      "channels"
    end
  end
end
