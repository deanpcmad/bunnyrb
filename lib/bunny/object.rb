require "ostruct"

module Bunny
  class Object < OpenStruct
    def initialize(attributes)
      super to_ostruct(attributes)
    end

    def to_ostruct(obj)
      if obj.is_a?(Hash)
        OpenStruct.new(obj.map { |key, val| [ camel_to_snake(key), to_ostruct(val) ] }.to_h)
      elsif obj.is_a?(Array)
        obj.map { |o| to_ostruct(o) }
      else # Assumed to be a primitive value
        obj
      end
    end

    def camel_to_snake(input)
      str = input.is_a?(Symbol) ? input.to_s : input
      snake_case_str = str.gsub(/([A-Z])/, '_\1').downcase
      snake_case_str.sub!(/^_/, "")
      input.is_a?(Symbol) ? snake_case_str.to_sym : snake_case_str
    end
  end
end
