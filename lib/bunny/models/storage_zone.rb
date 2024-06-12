module Bunny
  class StorageZone < Object
    class << self
      def list
        response = Client.get_request("storagezone")
        Collection.from_response(response, type: StorageZone)
      end

      def create(name:, region:, tier:)
        response = Client.post_request("storagezone", body: { Name: name, Region: region, ZoneTier: tier })
        StorageZone.new(response.body)
      end

      def retrieve(id:)
        response = Client.get_request("storagezone/#{id}")
        StorageZone.new(response.body)
      end

      def update(id:, **attributes)
        Client.post_request("storagezone/#{id}", body: attributes)
      end

      def delete(id:)
        Client.delete_request("storagezone/#{id}")
      end
    end
  end
end
