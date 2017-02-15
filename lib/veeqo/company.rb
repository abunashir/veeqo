module Veeqo
  class Company < Base
    def find
      Veeqo::Request.new(:get, end_point).run
    end

    def update(attributes)
      Veeqo::Request.new(:put, end_point, attributes).run
    end

    private

    def end_point
      "current_company"
    end
  end
end
