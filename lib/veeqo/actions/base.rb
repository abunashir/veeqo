require "veeqo/actions/list"
require "veeqo/actions/find"
require "veeqo/actions/delete"

module Veeqo
  module Actions
    module Base
      include Veeqo::Actions::List
      include Veeqo::Actions::Find
      include Veeqo::Actions::Delete
    end
  end
end
