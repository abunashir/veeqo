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

  describe ".find" do
    it "retrieves the details for a store" do
      store_id = 123

      stub_veeqo_store_find_api(store_id)
      store = Veeqo::Store.find(store_id)

      expect(store.name).not_to be_nil
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

  describe ".update" do
    it "updates the store with new attributes" do
      store_id = 123
      new_attributes = { name: "Phone" }

      stub_veeqo_store_update_api(store_id, new_attributes)
      store_update = Veeqo::Store.update(store_id, new_attributes)

      expect(store_update.successful?).to be_truthy
    end
  end

  describe ".delete" do
    it "deletes the specified store" do
      store_id = 123

      stub_veeqo_store_delete_api(store_id)
      store_deletion = Veeqo::Store.delete(store_id)

      expect(store_deletion.successful?).to be_truthy
    end
  end
end
