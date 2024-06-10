module Bunny
  class Zone < Object

    class << self

      def list
        response = Client.get_request("dnszone")
        Collection.from_response(response, type: Zone, key: "Items")
      end

      def create(name:)
        response = Client.post_request("dnszone", body: { Domain: name })
        Zone.new(response.body)
      end

      def retrieve(id:)
        response = Client.get_request("dnszone/#{id}")
        Zone.new(response.body)
      end

      def update(id:, **attributes)
        response = Client.post_request("dnszone/#{id}", body: attributes)
        Zone.new(response.body)
      end

      def delete(id:)
        Client.delete_request("dnszone/#{id}")
      end

      def export(id:)
        response = Client.get_request("dnszone/#{id}/export")
        response.body
      end

      def stats(id:)
        response = Client.get_request("dnszone/#{id}/statistics")
        ZoneStatistic.new(response.body)
      end

      def check_availability(name:)
        response = Client.post_request("dnszone/checkavailability", body: { Domain: name })
        response.body["Available"]
      end

      def create_record(zone:, type:, value:, **attributes)
        response = Client.put_request("dnszone/#{zone}/records", body: attributes.merge(type: type, value: value))
        Record.new(response.body)
      end

      def update_record(zone:, record:, **attributes)
        Client.post_request("dnszone/#{zone}/records/#{record}", body: attributes)
      end

      def delete_record(zone:, record:)
        Client.delete_request("dnszone/#{zone}/records/#{record}")
      end

    end

  end
end
