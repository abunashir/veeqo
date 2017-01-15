require "spec_helper"

RSpec.describe Veeqo::Actions::List do
  describe ".list" do
    context "without any filter arguments" do
      it "retrieves the list of all items" do
        stub_veeqo_product_list_api

        items = TestProduct.list

        expect(items.count).to eq(1)
        expect(items.first.id).not_to be_nil
      end
    end

    context "with custom filter arguments" do
      it "retrieves the list of filterred item" do
        filters = { page: 1, page_size: 10 }

        stub_veeqo_product_list_api(filters)
        items = TestProduct.list(filters)

        expect(items.count).to eq(1)
        expect(items.first.id).not_to be_nil
      end
    end
  end

  class TestProduct < Veeqo::Base
    include Veeqo::Actions::List

    private

    def end_point
      "products"
    end
  end
end
