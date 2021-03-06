# Veeqo

[![Build
Status](https://travis-ci.org/abunashir/veeqo.svg?branch=master)](https://travis-ci.org/abunashir/veeqo)
[![Code
Climate](https://codeclimate.com/github/abunashir/veeqo/badges/gpa.svg)](https://codeclimate.com/github/abunashir/veeqo)
[![Gem
Version](https://badge.fury.io/rb/veeqo.svg)](https://badge.fury.io/rb/veeqo)

The Ruby Interface to the Veeqo API

## Installation

Add this line to your application's Gemfile:

```ruby
gem "veeqo"
```

And then execute:

```sh
bundle install
```

## Configure

Follow [these simple steps] to get up and running with the Veeqo API. Once you
have your API key then you can configure it by adding an initializer with the
following code

```ruby
Veeqo.configure do |config|
  config.api_key = "SECRET_API_KEY"
end
```

Or

```ruby
Veeqo.configuration.api_key = "SECRET_API_KEY"
```

## Usage

### Order

Resources related to the orders in the API.

#### List orders

```ruby
Veeqo::Order.list(
  page: 1,
  page_size: 25,
  since_id: since_id,
  status: "awaiting_fulfillment",
  created_at_min: "2017-01-01 11:10:01",
  updated_at_min: "2017-01-01 11:10:01",
)
```

#### Create a new order

```ruby
# Create a new order for customer
#
# Please pay close attention to the argumetns construction.
# Some attrbitues require some nested attributes, that's why
# we've extracted those to make it easier to understand, but
# you don't have to do it unelss you prefer a clean code :)

Veeqo::Order.create(
  channel_id: store_id,
  customer_id: customer_id,
  delivery_method_id: deliver_method_id,
  deliver_to_id: deliver_to_id,
  total_discounts: 0,
  total_tax: 0,
  due_date: "",
  send_notification_email: false,
  deliver_to_attributes: deliver_to_attributes,
  line_items_attributes: [line_item_one_attributes]
  payment_attributes: payment_attributes,
)

# Delivery Attributes
#
# This includes the details attributes to specify the
# delivery details for that specific order.

deliver_to_attributes = {
  address1: "294 queenstown road",
  address2: "",
  city: "london",
  company: "",
  country: "GB",
  customer_id: customer_id,
  first_name: "Sky",
  last_name: "Schonhuber",
  phone: "07734450718",
  state: "london",
  zip: "sw8 4lt",
}

# Line Item Attributes
#
# This includes the details about a specific
# Line items for the new order

line_item_one_attributes = {
  price_per_unit: 13.99,
  quantity: "1",
  sellable_id: 1226615,
  tax_rate: 0
}

# Payment Attributes
#
# Include the payment details with the order

payment_attributes = {
  payment_type: "bank_transfer",
  reference_number: "123456789",
}
```

#### View an order details

```ruby
Veeqo::Order.find(order_id)
```

#### Update order details

```ruby
Veeqo::Order.update(order_id, new_attributes)
```

#### Delete an order

```ruby
Veeqo::Order.delete(order_id)
```

### Allocation

Resources related to the allocations in the API. This allocates a set of stock
item to a specific order. To allocate stock to an order, the item must be added
as a line item within that order and not be allocated already.

#### Create a new allocation

```ruby
Veeqo::Allocation.create(
  order_id: 123_456,
  warehouse_id: 456_789,
  line_items: [{
    quantity: 1,
    sellable_id: 123_456,
  }],
)
```

#### Update a allocation details

```ruby
Veeqo::Allocation.update(
  allocation_id,
  order_id: 123_456,
  warehouse_id: 456_789,
  line_items: [{
    quantity: 2,
    sellable_id: 123_456,
  }],
)
```

#### Delete an existing allocation

```ruby
Veeqo::Allocation.delete(order_id, allocation_id)
```

### Product

Resources related to the products in the API.

#### List all products

```ruby
Veeqo::Product.list(
  since_id: 123_45, page: 1, page_size: 12
)
```

#### Create a new product

```ruby
# Create a new product
#
# Pay close attension to the argument constructions. It
# simlify the process, and the `variants` and `images`
# supports mutiple item, and we can pass those as an
# array, please check the example bellow for inspiration

Veeqo::Product.create(
  title: "T Shirt",
  description: "The best t-shirt!",
  estimated_delivery: 3,
  notes: "This is a limited addtion!",
  variants: [variant_one_attributes],
  images: [image_one_attributes],
)

# Variant attributes
variant_one_attributes = {
  cost_price: "10",
  min_reorder_level: "0",
  price: "15",
  quantity_to_reorder: "0",
  sku_code: "t-shirt-large",
  tax_rate: "0",
  title: "Large",
}

# Image attributes
image_one_attributes = {
  display_position: "1"
  src: "http://veeqo.com/t-shirt.jpg",
}
```

#### View a product details

```ruby
Veeqo::Product.find(product_id)
```

#### Update product details

```ruby
Veeqo::Product.update(product_id, new_attributes)
```

#### Delete a product

```ruby
Veeqo::Product.delete(product_id)
```

### Purchase Orders

Resources related to the purchase orders in the API.

#### List purchase orders

```ruby
Veeqo::PurchaseOrder.list(
  page: 1, page_size: 12, show_complete: false
)
```

### Suppliers

Resources related to the suppliers in the API.

#### List all suppliers

```ruby
Veeqo::Supplier.list(page: 1, page_size: 12)
```

#### Create a new supplier

```ruby
Veeqo::Supplier.create(name: "ACME")
```

#### View a supplier details

```ruby
Veeqo::Supplier.find(supplier_id)
```

#### Update a supplier details

```ruby
Veeqo::Supplier.update(supplier_id, new_attributes_hash)
```

#### Delete a supplier

```ruby
Veeqo::Supplier.delete(supplier_id)
```

### Company

Information about current company

#### View company details

```ruby
Veeqo::Company.find
```

#### Update company details

```ruby
Veeqo::Company.update(new_attributes_hash)
```

### Warehouse

Resources related to the warehouses in the API.

#### List all warehouses

```ruby
Veeqo::Warehouse.list(page: 1, page_size: 12)
```

#### Create a new warehouse

```ruby
Veeqo::Warehouse.create(name: "My Warehouse")
```

#### View a warehouse details

```ruby
Veeqo::Warehouse.find(warehouse_id)
```

#### Update a warehouse details

```ruby
Veeqo::Warehouse.update(warehouse_id, new_attributes_hash)
```

#### Delete a warehouse

```ruby
Veeqo::Warehouse.delete(warehouse_id)
```

### Customer

Resources related to the customers in the API.

#### List all customers

```ruby
Veeqo::Customer.list(page: 1, page_size: 12)
```

#### Create a customer

```ruby
Veeqo::Customer.create(
  email: "customer@example.com",
  phone: "01792 720740",
  mobile: "07329023903",
  billing_address_attributes: {
    first_name: "John",
    last_name: "Doe",
    company: "FooBar Ltd",
    address1: "221 High Street Lane",
    city: "Swansea",
    country: "GB",
    zip: "SA1 1NW",
  }
)
```

#### View a customer details

```ruby
Veeqo::Customer.find(customer_id)
```

#### Update a customer details

```ruby
Veeqo::Customer.update(
  customer_id, new_attributes_hash
)
```

#### Delete a customer

```ruby
Veeqo::Customer.delete(customer_id)
```

### Store

Resources related to the stores in the API.

#### List all stores

```ruby
Veeqo::Store.list(page: 1, page_size: 12)
```

#### Create a new store

```ruby
Veeqo::Store.create(name: "Phone", type_code: "direct")
```

#### View a store details

```ruby
Veeqo::Store.find(store_id)
```

#### Update a store details

```ruby
Veeqo::Store.update(store_id, new_attributes_hash)
```

#### Delete a store

```ruby
Veeqo::Store.delete(store_id)
```

### Delivery Method

Resources related to the delivery methods in the API

#### List all delivery methods

```ruby
Veeqo::DeliveryMethod.list(page: 1, page_size: 12)
```

#### Create a delivery method

```ruby
Veeqo::DeliveryMethod.create(name: "Next Day Delivery")
```

#### View a delivery method details

```ruby
Veeqo::DeliveryMethod.find(delivery_method_id)
```

#### Update a delivery method

```ruby
Veeqo::DeliveryMethod.update(delivery_method_id, new_attributes_hash)
```

#### Delete a delivery method

```ruby
Veeqo::DeliveryMethod.delete(delivery_method_id)
```

### Shipment

Information about creating shipments in the API. Please follow the [shipment doc]
regarding the `carrier_id` or other details.

#### Create a shipment

```ruby
# Create a new shipment
#
# Please pay close attention to the construciton of
# the arugments, This simplified some attrbitues, so
# the developer does not need to worry about the too
# much details on how it needs to structured.

Veeqo::Shipment.create(
  order_id: 1,
  allocation_id: 1,
  shipment: {
    carrier_id: 3,
    notify_customer: false,
    update_remote_order: false,
    tracking_number: "12345679ABC",
  },
)
```

### Tags

Resources related to the order tags in the API.

#### List All Tags

```ruby
Veeqo::Tag.list
```

#### Delete a shipment

```ruby
Veeqo::Shipment.delete(shipment_id)
```

## Development

We are following Sandi Metz's Rules for this gem, you can read the
[description of the rules here] (http://robots.thoughtbot.com/post/50655960596/sandi-metz-rules-for-developers).
All new code should follow these rules. If you make changes in a pre-existing
file that violates these rules you should fix the violations as part of your
contribution.

### Setup

Clone the repository.

```sh
git clone https://github.com/abunashir/veeqo
```

Setup your environment.

```sh
bin/setup
```

Run the test suite

```sh
bin/rspec
```

### Play Box

The API Play Box provides an interactive console so we can easily test out the
actual API interaction. But before moving forward let's configure the key and
API host (In case you wanna test on a mock server).

Setup the client configuration.

```sh
cp .sample.pryrc .pryrc
vim .pryrc
```

Start the console.

```sh
bin/console
```

Start playing with it.

```ruby
Veeqo::Order.list
```

## Contributing

First, thank you for contributing! We love pull requests from everyone. By
participating in this project, you hereby grant the right to grant or transfer
an unlimited number of non exclusive licenses or sub-licenses to third parties,
under the copyright covering the contribution to use the contribution by all
means.

Here are a few technical guidelines to follow:

1. Open an [issue][issues] to discuss a new feature.
1. Write tests to support your new feature.
1. Make sure the entire test suite passes locally and on CI.
1. Open a Pull Request.
1. [Squash your commits][squash] after receiving feedback.
1. Party!

[issues]: https://github.com/abunashir/veeqo/issues
[squash]: https://github.com/thoughtbot/guides/tree/master/protocol/git#write-a-feature

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

[these simple steps]: http://docs.veeqo.apiary.io/#introduction/getting-started
[shipment doc]: http://docs.veeqo.apiary.io/#reference/shipments
