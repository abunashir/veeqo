module FakeVeeqoApi
  def stub_veeqo_order_list_api(filters = nil)
    stub_api_response(
      :get,
      "orders",
      data: filters,
      filename: "orders",
      status: 200,
    )
  end

  def stub_veeqo_order_find_api(order_id)
    stub_api_response(
      :get,
      ["orders", order_id].join("/"),
      filename: "order",
      status: 200,
    )
  end

  def stub_veeqo_order_create_api(order_attributes)
    stub_api_response(
      :post,
      "orders",
      status: 201,
      filename: "order_created",
      data: { "order": order_attributes },
    )
  end

  def stub_veeqo_order_update_api(order_id, attributes)
    stub_api_response(
      :put,
      ["orders", order_id].join("/"),
      data: attributes,
      filename: "empty",
      status: 204,
    )
  end

  def stub_veeqo_order_delete_api(order_id)
    stub_api_response(
      :delete,
      ["orders", order_id].join("/"),
      filename: "empty",
      status: 204,
    )
  end

  def stub_veeqo_product_list_api(filters = {})
    stub_api_response(
      :get,
      "products",
      data: filters,
      filename: "products",
      status: 200,
    )
  end

  def stub_veeqo_product_find_api(product_id)
    stub_api_response(
      :get, ["products", product_id].join("/"), filename: "product", status: 200
    )
  end

  def stub_veeqo_product_create_api(attributes)
    attributes[:product_variants_attributes] = attributes.delete(:variants)
    attributes[:images_attributes] = attributes.delete(:images)

    stub_api_response(
      :post,
      "products",
      data: { product: attributes },
      filename: "product_created",
      status: 201,
    )
  end

  def stub_veeqo_product_update_api(product_id, new_attributes)
    stub_api_response(
      :put,
      ["products", product_id].join("/"),
      data: { product: new_attributes },
      filename: "empty",
      status: 204,
    )
  end

  def stub_veeqo_product_delete_api(id)
    stub_api_response(
      :delete, ["products", id].join("/"), filename: "empty", status: 204
    )
  end

  def stub_veeqo_purchase_order_list_api(filters = {})
    stub_api_response(
      :get,
      "purchase_orders",
      data: filters,
      status: 200,
      filename: "purchase_orders",
    )
  end

  def stub_veeqo_supplier_list_api(filters = {})
    stub_api_response(
      :get,
      "suppliers",
      data: filters,
      status: 200,
      filename: "suppliers",
    )
  end

  def stub_veeqo_supplier_create_api(attributes)
    stub_api_response(
      :post,
      "suppliers",
      data: attributes,
      status: 201,
      filename: "supplier_created",
    )
  end

  def stub_veeqo_supplier_find_api(id)
    stub_api_response(
      :get, ["suppliers", id].join("/"), status: 200, filename: "supplier"
    )
  end

  def stub_veeqo_supplier_update_api(id, attributes)
    stub_api_response(
      :put,
      ["suppliers", id].join("/"),
      data: attributes,
      filename: "empty",
      status: 204,
    )
  end

  def stub_veeqo_supplier_delete_api(id)
    stub_api_response(
      :delete, ["suppliers", id].join("/"), status: 204, filename: "empty"
    )
  end

  def stub_veeqo_company_find_api
    stub_api_response(
      :get, "current_company", status: 200, filename: "company"
    )
  end

  def stub_veeqo_company_update_api(attributes)
    stub_api_response(
      :put, "current_company", data: attributes, filename: "empty", status: 204
    )
  end

  def stub_veeqo_warehouse_list_api(filters = {})
    stub_api_response(
      :get, "warehouses", data: filters, status: 200, filename: "warehouses"
    )
  end

  def stub_veeqo_warehouse_create_api(attributes)
    stub_api_response(
      :post,
      "warehouses",
      data: attributes,
      status: 201,
      filename: "warehouse_created",
    )
  end

  def stub_veeqo_warehouse_find_api(id)
    stub_api_response(
      :get, ["warehouses", id].join("/"), filename: "warehouse", status: 200
    )
  end

  def stub_veeqo_warehouse_update_api(id, attributes)
    stub_api_response(
      :put,
      ["warehouses", id].join("/"),
      data: attributes,
      filename: "empty",
      status: 204,
    )
  end

  def stub_veeqo_warehouse_delete_api(id)
    stub_api_response(
      :delete, ["warehouses", id].join("/"), filename: "empty", status: 204
    )
  end

  def stub_veeqo_customer_list_api(filters = {})
    stub_api_response(
      :get, "customers", data: filters, filename: "customers", status: 200
    )
  end

  def stub_veeqo_customer_find_api(id)
    stub_api_response(
      :get, ["customers", id].join("/"), filename: "customer", status: 200
    )
  end

  def stub_veeqo_customer_create_api(attributes)
    stub_api_response(
      :post,
      "customers",
      data: { customer: attributes },
      filename: "customer_created",
      status: 201,
    )
  end

  def stub_veeqo_customer_update_api(id, attributes)
    stub_api_response(
      :put,
      ["customers", id].join("/"),
      data: { customer: attributes },
      filename: "empty",
      status: 204,
    )
  end

  def stub_veeqo_customer_delete_api(id)
    stub_api_response(
      :delete, ["customers", id].join("/"), filename: "empty", status: 204
    )
  end

  def stub_veeqo_store_list_api(filters = {})
    stub_api_response(
      :get, "channels", data: filters, filename: "stores", status: 200
    )
  end

  def stub_veeqo_store_create_api(attributes)
    stub_api_response(
      :post,
      "channels",
      data: attributes,
      filename: "store_created",
      status: 201,
    )
  end

  def stub_veeqo_store_find_api(id)
    stub_api_response(
      :get, ["channels", id].join("/"), filename: "store", status: 200
    )
  end

  def stub_veeqo_store_update_api(id, attributes)
    stub_api_response(
      :put,
      ["channels", id].join("/"),
      data: attributes,
      filename: "empty",
      status: 204,
    )
  end

  private

  def stub_api_response(method, end_point, filename:, status:, data: nil)
    stub_request(method, api_end_point(end_point)).
      with(api_request_headers(data: data)).
      to_return(response_with(filename: filename, status: status))
  end

  def api_end_point(end_point)
    [Veeqo.configuration.api_host, end_point].join("/")
  end

  def api_request_headers(data:)
    Hash.new.tap do |request_headers|
      request_headers[:headers] = api_key_header

      unless data.nil?
        request_headers[:body] = data.to_json
      end
    end
  end

  def api_key_header
    { "x-api-key" => Veeqo.configuration.api_key }
  end

  def response_with(filename:, status:)
    { body: veeqo_fixture(filename), status: status }
  end

  def veeqo_fixture(filename)
    file_name = [filename, "json"].join(".")
    file_path = ["../../", "fixtures", file_name].join("/")

    File.read(File.expand_path(file_path, __FILE__))
  end
end
