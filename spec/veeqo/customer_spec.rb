require "spec_helper"

RSpec.describe Veeqo::Customer do
  describe ".list" do
    it "retrieves the list of all customers" do
      filters = { page: 1, page_size: 12 }

      stub_veeqo_customer_list_api(filters)
      customers = Veeqo::Customer.list(filters)

      expect(customers.count).to eq(1)
      expect(customers.first.id).not_to be_nil
    end
  end

  describe ".find" do
    it "retrives the details for a customer" do
      customer_id = 123

      stub_veeqo_customer_find_api(customer_id)
      customer = Veeqo::Customer.find(customer_id)

      expect(customer.id).to eq(123)
      expect(customer.email).not_to be_nil
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

  describe ".update" do
    it "updates the customer with new attributes" do
      customer_id = 123
      new_attributes = { email: "customer@example.com" }

      stub_veeqo_customer_update_api(customer_id, new_attributes)
      customer_update = Veeqo::Customer.update(customer_id, new_attributes)

      expect(customer_update.successful?).to be_truthy
    end
  end

  describe ".delete" do
    it "deletes the specified customer" do
      customer_id = 123

      stub_veeqo_customer_delete_api(customer_id)
      customer_deletion = Veeqo::Customer.delete(customer_id)

      expect(customer_deletion.successful?).to be_truthy
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
