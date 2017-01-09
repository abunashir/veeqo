module Veeqo
  class Company < Base
    def find
      Veeqo.get_resource(end_point)
    end

    private

    def end_point
      "current_company"
    end
  end
end
