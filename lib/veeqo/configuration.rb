module Veeqo
  class Configuration
    attr_accessor :api_host, :api_key

    def initialize
      @api_host ||= "https://api.veeqo.com"
    end
  end

  def self.configure
    yield configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end
end
