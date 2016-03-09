module Infobip
  module SmsApi
    class Configuration
      attr_accessor :username, :password, :endpoint, :connection, :debug

      def initialize
        @endpoint = 'https://api.infobip.com'
        @debug = false
      end

      def connect
        raise 'Username and/or password are not configured' unless @username && @password
        @connection = Faraday.new(url: @endpoint) do |faraday|
          faraday.adapter :net_http
          faraday.response :logger if @debug
        end
        @connection.basic_auth @username, @password
      end
    end
  end
end