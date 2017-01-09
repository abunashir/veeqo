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

  describe ".create" do
    it "creates a new customer" do
      stub_veeqo_customer_create_api(customer_attributes)
      customer = Veeqo::Customer.create(customer_attributes)

      expect(customer.id).to eq(123)
      expect(customer.email).to eq(customer_attributes[:email])
    end
  end

  def customer_attributes
    {
      email: "customer@example.com",
      phone: "01792 720740",
      mobile: "07329023903",
      billing_address: {
        first_name: "John",
        last_name: "Doe",
        company: "FooBar Ltd",
        address1: "221 High Street Lane",
        city: "Swansea",
        country: "GB",
        zip: "SA1 1NW",
      },
    }
  end
end
