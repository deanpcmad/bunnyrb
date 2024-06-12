module Bunny
  class PullZone < Object
    class << self
      def list
        response = Client.get_request("pullzone")
        Collection.from_response(response, type: PullZone)
      end

      def create(name:, **attributes)
        response = Client.post_request("pullzone", body: attributes.merge(name: name))
        PullZone.new(response.body)
      end

      def retrieve(id:)
        response = Client.get_request("pullzone/#{id}")
        PullZone.new(response.body)
      end

      def update(id:, **attributes)
        response = Client.post_request("pullzone/#{id}", body: attributes)
        PullZone.new(response.body)
      end

      def delete(id:)
        Client.delete_request("pullzone/#{id}")
      end

      def purge(id:)
        Client.post_request("pullzone/#{id}/purgeCache", body: {})
      end
    end
  end
end
