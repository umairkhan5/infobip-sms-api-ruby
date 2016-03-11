module Infobip
  module SmsApi
    module Messages

      def self.send_single(message)
        if message.class == Infobip::SmsApi::Request::TextMessage
          return send_single_text_message message
        elsif message.class == Infobip::SmsApi::Request::BinaryMessage
          return send_single_binary_message message
        else
          raise UnknownArgumentError, "Unknown message type: #{message.class}"
        end
      end

      def self.send_multiple(messages)
        return send_multiple_text_messages messages if valid_messages?(messages, Infobip::SmsApi::Request::TextMessage)
        return send_multiple_binary_messages messages if valid_messages?(messages, Infobip::SmsApi::Request::BinaryMessage)
        raise MalformedArgumentError, 'When sending multiple messages, all messages need to be of the same type'
      end

      def self.valid_messages?(messages, object_class)
        messages.all? do |message|
          message.class == object_class
        end
      end

      def self.send_single_text_message(message)
        raise UnknownArgumentError, "Unsupported Message Type: #{message.class}" unless message.class == Infobip::SmsApi::Request::TextMessage
        response = self.post('/sms/1/text/single', message)
        Response::Base.new(response.status, JSON.parse(response.body))
      end

      def self.send_single_binary_message(message)
        raise UnknownArgumentError, "Unsupported Message Type: #{message.class}" unless message.class == Infobip::SmsApi::Request::BinaryMessage
        response = self.post('/sms/1/binary/single', message)
        Response::Base.new(response.status, JSON.parse(response.body))
      end

      def self.send_multiple_text_messages(messages)
        response = self.post('/sms/1/text/multi', { messages: messages.map(&:to_hash) })
        Response::Base.new(response.status, JSON.parse(response.body))
      end

      def self.send_multiple_binary_messages(messages)
        response = self.post('/sms/1/binary/multi', { messages: messages.map(&:to_hash) })
        Response::Base.new(response.status, JSON.parse(response.body))
      end

      def self.post(url, body)
        Infobip::SmsApi.configuration.connection.post do |req|
          req.url url
          req.body = body.to_json
          req.headers['Accept'] = 'application/json'
          req.headers['Content-Type'] = 'application/json'
        end
      end

    end
  end
end