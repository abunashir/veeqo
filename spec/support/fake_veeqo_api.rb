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
      request_headers[:body] = data
      request_headers[:headers] = api_key_header
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