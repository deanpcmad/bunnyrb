require "faraday"
require "faraday/multipart"
require "marcel"

require_relative "bunny/version"

module Bunny

  autoload :Configuration, "bunny/configuration"
  autoload :Client, "bunny/client"
  autoload :Collection, "bunny/collection"
  autoload :Error, "bunny/error"
  autoload :Object, "bunny/object"

  class << self
    attr_writer :config
  end

  def self.configure
    yield(config) if block_given?
  end

  def self.config
    @config ||= Bunny::Configuration.new
  end

  autoload :Country, "bunny/models/country"
  autoload :Region, "bunny/models/region"
  autoload :Zone, "bunny/models/zone"
  autoload :StorageZone, "bunny/models/storage_zone"

  autoload :Record, "bunny/models/record"
  autoload :ZoneStatistic, "bunny/models/zone_statistic"

  # Edge API
  module Edge
    autoload :Client, "bunny/edge/client"
    autoload :Upload, "bunny/edge/models/upload"
  end

end
