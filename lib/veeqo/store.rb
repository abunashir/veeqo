module Veeqo
  class Store < Base
    include Veeqo::Actions::List

    private

    def end_point
      "channels"
    end
  end
end
