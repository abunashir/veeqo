require "spec_helper"

RSpec.describe Veeqo::Store do
  describe ".list" do
    it "retrieves all the stores" do
      filters = { page: 1, page_size: 12 }

      stub_veeqo_store_list_api(filters)
      stores = Veeqo::Store.list(filters)

      expect(stores.count).to eq(1)
      expect(stores.first.id).to eq(123)
    end
  end
end
