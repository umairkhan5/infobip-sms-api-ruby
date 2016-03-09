require 'faraday'
require 'json'

module Infobip
  module SmsApi
    class Message

      attr_accessor :from, :to, :text

      def initialize(attributes)
        self.from = attributes[:from]
        self.to = attributes[:to]
        self.text = attributes[:text]
      end

      def to_hash
        hash = {}
        self.instance_variables.each do |var|
          hash[var.to_s.delete('@')] = self.instance_variable_get(var)
        end
        hash
      end

      def send_text
        response = Infobip::SmsApi.configuration.connection.post do |req|
          req.url '/sms/1/text/single'
          req.body = self.to_hash.to_json
          req.headers['Accept'] = 'application/json'
          req.headers['Content-Type'] = 'application/json'
        end
        Infobip::SmsApi::Response::Base.new(response.status, JSON.parse(response.body))
      end

    end
  end
end
