require "spec_helper"

RSpec.describe Veeqo::Customer do
  describe ".list" do
    context "without any filters" do
      it "retrieves the list of customers" do
        stub_veeqo_customer_list_api
        customers = Veeqo::Customer.list

        expect(customers.count).to eq(1)
        expect(customers.first.id).not_to be_nil
        expect(customers.first.email).not_to be_nil
      end
    end

    context "with custom filters" do
      it "retrieves the specified customers" do
        filters = { page: 1, page_size: 12 }

        stub_veeqo_customer_list_api(filters)
        customers = Veeqo::Customer.list(filters)

        expect(customers.count).to eq(1)
        expect(customers.first.id).not_to be_nil
      end
    end
  end
end
