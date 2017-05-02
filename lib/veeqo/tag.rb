module Veeqo
  class Tag < Base
    include Veeqo::Actions::List

    private

    def end_point
      "tags"
    end
  end
end
