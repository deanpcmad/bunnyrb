module Bunny
  class Region < Object
    class << self
      def list
        response = Client.get_request("region")
        Collection.from_response(response, type: Region)
      end
    end
  end
end
