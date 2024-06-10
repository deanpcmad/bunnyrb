# BunnyRB

BunnyRB is a Ruby library for the Bunny API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "bunnyrb"
```

## Usage

### Set Client Details

Firstly you'll need to grab your API Token on the [Account API Key](https://dash.bunny.net/account/api-key) page
and then configure it like below.

```ruby
Bunny.configure do |config|
  config.api_token = ENV["BUNNT_API_KEY"]
end
```

### Countries

```ruby
Bunny::Country.list
```

### Regions

```ruby
Bunny::Region.list
```

### Zones

```ruby
# Retrieve a list of Zone's
Bunny::Zone.list

# Retrieve a zone
Bunny::Zone.retrieve id: 123

# Create a zone
Bunny::Zone.create(name: "mydomain.com")

# Update a zone
# API Docs: https://docs.bunny.net/reference/dnszonepublic_update
Bunny::Zone.update id: 123, LoggingEnabled: true

# Delete a zone
Bunny::Zone.delete id: 123

# Export a DNS Zone file
# Returns a string
Bunny::Zone.export id: 123

# Retrieve DNS Query Statistics for a zone
Bunny::Zone.stats id: 123

# Create a DNS Record for a zone
# API Docs: https://docs.bunny.net/reference/dnszonepublic_addrecord
Bunny::Zone.create_record zone: 123, type: "A", value: "1.1.1.1", name: "sub"

# Update a DNS Record for a zone
# API Docs: https://docs.bunny.net/reference/dnszonepublic_updaterecord
Bunny::Zone.update_record zone: 123, record: 123, value: "1.0.0.1"

# Delete a DNS Record for a zone
Bunny::Zone.delete_record zone: 123, record: 123
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/deanpcmad/bunnyrb.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
