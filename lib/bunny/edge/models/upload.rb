module Bunny
  module Edge
    class Upload < Object
      class << self
        def list(zone: Bunny.config.edge_name, path:)
          response = Edge::Client.get_request("#{zone}/#{path}")
          Collection.from_response(response, type: Upload)
        end

        def create(zone: Bunny.config.edge_name, path: nil, name:, file:)
          headers = {
            "Content-Length" => file.size.to_s,
            "Content-Type" => Marcel::MimeType.for(file)
          }
          response = Edge::Client.put_request([ zone, path, name ].join("/"), body: file, headers: headers)
          response.success?
        end

        def download(zone: Bunny.config.edge_name, path: nil, name:)
          response = Edge::Client.get_request([ zone, path, name ].join("/"))

          tempfile = Tempfile.new
          tempfile.binmode
          tempfile.write(response.body)
          tempfile.rewind

          tempfile
        end

        def delete(zone: Bunny.config.edge_name, path: nil, name: nil)
          response = Edge::Client.delete_request([ zone, path, name ].join("/"))
          response.success?
        end
      end
    end
  end
end
