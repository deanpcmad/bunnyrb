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
  config.api_token = ENV["BUNNY_API_KEY"]

  config.edge_region = ENV["BUNNY_EDGE_REGION"]
  config.edge_api_token = ENV["BUNNY_EDGE_API_TOKEN"]
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

### Pull Zones

```ruby
# Retrieve a list of Pull Zone's
Bunny::PullZone.list

# Retrieve a pull zone
Bunny::PullZone.retrieve id: 123

# Create a pull zone
# API Docs: https://docs.bunny.net/reference/pullzonepublic_add
Bunny::PullZone.create(name: "mypullzone")

# Update a pull zone
# API Docs: https://docs.bunny.net/reference/pullzonepublic_updatepullzone
Bunny::PullZone.update id: 123, EnableGeoZoneUS: true

# Delete a pull zone
Bunny::PullZone.delete id: 123

# Purge a pull zone
# API Docs: https://docs.bunny.net/reference/pullzonepublic_purgecache
Bunny::PullZone.purge id: 123
```

### Storage Zones

```ruby
# Retrieve a list of Storage Zone's
Bunny::StorageZone.list

# Retrieve a storage zone
Bunny::StorageZone.retrieve id: 123

# Create a storage zone
# API Docs: https://docs.bunny.net/reference/storagezonepublic_add
Bunny::StorageZone.create(name: "mystoragezone", region: "UK", tier: "Standard")

# Update a storage zone
# API Docs: https://docs.bunny.net/reference/storagezonepublic_update
Bunny::StorageZone.update id: 123, OriginUrl: "https://mysite.com"

# Delete a storage zone
Bunny::StorageZone.delete id: 123
```

### Video Libraries

```ruby
# Retrieve a list of Video Libraries
Bunny::VideoLibrary.list

# Retrieve a video library
Bunny::VideoLibrary.retrieve id: 123

# Create a video library
# API Docs: https://docs.bunny.net/reference/videolibrarypublic_add
Bunny::VideoLibrary.create(name: "myvideolibrary")

# Update a video library
# API Docs: https://docs.bunny.net/reference/videolibrarypublic_update
Bunny::VideoLibrary.update id: 123, EnableDRM: true

# Delete a video library
Bunny::VideoLibrary.delete id: 123
```

## Edge API

The Edge API is for managing files on the Bunny Edge Storage Service.

```ruby
# List all files in a zone
Bunny::Edge::Upload.list(zone: "myzone", path: "/path/to/files")

# Create a file
file = File.new("myfile.txt")
response = Bunny::Edge::Upload.create(zone: "myzone", path: "/path/to/files", name: "myfile.txt", file: file)

# Download a file
# Returns a Tempfile
Bunny::Edge::Upload.download(zone: "myzone", path: "/path/to/files", name: "myfile.txt")

# Delete a file
Bunny::Edge::Upload.delete(zone: "myzone", path: "/path/to/files", name: "myfile.txt")
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/deanpcmad/bunnyrb.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
