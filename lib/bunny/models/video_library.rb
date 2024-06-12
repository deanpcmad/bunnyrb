module Bunny
  class VideoLibrary < Object
    class << self
      def list
        response = Client.get_request("videolibrary")
        Collection.from_response(response, type: VideoLibrary)
      end

      def create(name:)
        response = Client.post_request("videolibrary", body: { name: name })
        VideoLibrary.new(response.body)
      end

      def retrieve(id:)
        response = Client.get_request("videolibrary/#{id}")
        VideoLibrary.new(response.body)
      end

      def update(id:, **attributes)
        response = Client.post_request("videolibrary/#{id}", body: attributes)
        VideoLibrary.new(response.body)
      end

      def delete(id:)
        Client.delete_request("videolibrary/#{id}")
      end
    end
  end
end
