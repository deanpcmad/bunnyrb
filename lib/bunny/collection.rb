module Bunny
  class Collection
    attr_reader :data, :total

    def self.from_response(response, type:, key: nil)
      body = response.body

      if key.is_a?(String)
        data = body[key].map { |attrs| type.new(attrs) }
      else
        data = body.map { |attrs| type.new(attrs) }
      end

      new(
        data: data,
        total: data.count
      )
    end

    def initialize(data:, total:)
      @data = data
      @total = total
    end
  end
end
