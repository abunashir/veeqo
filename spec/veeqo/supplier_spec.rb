require "spec_helper"

RSpec.describe Veeqo::Supplier do
  describe ".list" do
    it "retrieves the list of suppliers" do
      filters = { page: 1, page_size: 12 }

      stub_veeqo_supplier_list_api(filters)
      suppliers = Veeqo::Supplier.list(filters)

      expect(suppliers.count).to eq(1)
      expect(suppliers.first.id).not_to be_nil
    end
  end

  describe ".find" do
    it "retrieves the supplier details" do
      supplier_id = 123

      stub_veeqo_supplier_find_api(supplier_id)
      supplier = Veeqo::Supplier.find(supplier_id)

      expect(supplier.name).to eq("ACME")
    end
  end

  describe ".create" do
    it "creates a new supplier" do
      supplier_attributes = { name: "ACME" }

      stub_veeqo_supplier_create_api(supplier_attributes)
      supplier = Veeqo::Supplier.create(supplier_attributes)

      expect(supplier.id).not_to be_nil
      expect(supplier.name).to eq(supplier_attributes[:name])
    end
  end

  describe ".update" do
    it "updates the supplier with new attributes" do
      supplier_id = 123
      new_attributes = { name: "ACME" }

      stub_veeqo_supplier_update_api(supplier_id, new_attributes)
      supplier_update = Veeqo::Supplier.update(supplier_id, new_attributes)

      expect(supplier_update.successful?).to be_truthy
    end
  end

  describe ".delete" do
    it "deletes the specified supplier" do
      supplier_id = 123

      stub_veeqo_supplier_delete_api(supplier_id)
      supplier_delete = Veeqo::Supplier.delete(supplier_id)

      expect(supplier_delete.successful?).to be_truthy
    end
  end
end
