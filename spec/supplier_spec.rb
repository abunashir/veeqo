require "spec_helper"

RSpec.describe Veeqo::Supplier do
  describe ".list" do
    context "without any filter params" do
      it "retrieves the list of suppliers" do
        stub_veeqo_supplier_list_api
        suppliers = Veeqo::Supplier.list

        expect(suppliers.count).to eq(1)
        expect(suppliers.first.id).not_to be_nil
      end
    end

    context "with additional filters" do
      it "retrives the spcified suppliers" do
        filters = { page: 1, page_size: 12 }

        stub_veeqo_supplier_list_api(filters)
        suppliers = Veeqo::Supplier.list(filters)

        expect(suppliers.count).to eq(1)
        expect(suppliers.first.id).not_to be_nil
      end
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
end
