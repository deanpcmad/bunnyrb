module Bunny
  class Country < Object
    class << self
      def list
        response = Client.get_request("country")
        Collection.from_response(response, type: Country)
      end
    end
  end
end
