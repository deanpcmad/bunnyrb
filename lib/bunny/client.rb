module Bunny
  class Client

    BASE_URL = "https://api.bunny.net"

    class << self

      def connection
        @connection ||= Faraday.new(BASE_URL) do |conn|
          conn.headers = {
            "AccessKey" => Bunny.config.api_token,
            "User-Agent" => "bunnyrb/v#{VERSION} (github.com/deanpcmad/bunnyrb)"
          }

          conn.request :json

          conn.response :json, content_type: "application/json"
        end
      end

      def get_request(url, params: {}, headers: {})
        handle_response connection.get(url, params, headers)
      end

      def post_request(url, body: {}, headers: {})
        handle_response connection.post(url, body, headers)
      end

      def put_request(url, body:, headers: {})
        handle_response connection.put(url, body, headers)
      end

      def patch_request(url, body:, headers: {})
        handle_response connection.patch(url, body, headers)
      end

      def delete_request(url, headers: {})
        handle_response connection.delete(url, headers)
      end

      def handle_response(response)
        case response.status
        when 400
          raise Error, "Error 400: Your request was malformed. '#{response.body["Message"]}'"
        when 401
          raise Error, "Error 401: You did not supply valid authentication credentials. '#{response.body["Message"]}'"
        when 403
          raise Error, "Error 403: You are not allowed to perform that action. '#{response.body["Message"]}'"
        when 404
          raise Error, "Error 404: No results were found for your request. '#{response.body["Message"]}'"
        when 405
          raise Error, "Error 405: Method Not Allowed. '#{response.body["Message"]}'"
        when 409
          raise Error, "Error 409: Your request was a conflict. '#{response.body["Message"]}'"
        when 422
          raise Error, "Error 422: Unprocessable Content. '#{response.body["Message"]}'"
        when 429
          raise Error, "Error 429: Your request exceeded the API rate limit. '#{response.body["Message"]}'"
        when 500
          raise Error, "Error 500: We were unable to perform the request due to server-side problems. '#{response.body["Message"]}'"
        when 503
          raise Error, "Error 503: You have been rate limited for sending more than 20 requests per second. '#{response.body["Message"]}'"
        when 501
          raise Error, "Error 501: This resource has not been implemented. '#{response.body["Message"]}'"
        when 204
          return true
        end

        response
      end
    end

  end
end
