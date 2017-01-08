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
end
