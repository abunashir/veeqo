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

  describe ".create" do
    it "creates a new store" do
      store_attributes = { name: "Phone", type_code: "direct" }

      stub_veeqo_store_create_api(store_attributes)
      store = Veeqo::Store.create(store_attributes)

      expect(store.id).not_to be_nil
      expect(store.name).to eq(store_attributes[:name])
    end
  end
end
