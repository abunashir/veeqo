# Veeqo

[![Build
Status](https://travis-ci.org/abunashir/veeqo.svg?branch=master)](https://travis-ci.org/abunashir/veeqo)
[![Code
Climate](https://codeclimate.com/github/abunashir/veeqo/badges/gpa.svg)](https://codeclimate.com/github/abunashir/veeqo)

The Interface to the Veeqo API

## Installation

Add this line to your application's Gemfile:

```ruby
gem "veeqo", github: "abunashir/veeqo"
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
  since_id: 12345,
  status: "awaiting_fulfillment"
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
  channel_id: "3525",
  customer_id: "516208",
  delivery_method_id: "92298",
  deliver_to_id: "1086864",
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
  customer_id: "516208",
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

### Product

Resources related to the products in the API.

#### List all products

```ruby
Veeqo::Product.list(
  since_id: 123_45, page: 1, page_size: 12
)
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

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/veeqo. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

[these simple steps]: http://docs.veeqo.apiary.io/#introduction/getting-started
