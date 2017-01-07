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

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/veeqo. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

[these simple steps]: http://docs.veeqo.apiary.io/#introduction/getting-started
