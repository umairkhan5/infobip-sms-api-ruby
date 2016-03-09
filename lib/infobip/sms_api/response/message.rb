module Infobip
  module SmsApi
    module Response
      class Message
        attr_reader :to, :status, :sms_count, :message_id

        def initialize(attributes)
          @to = attributes['to']
          @status = Infobip::SmsApi::Response::Status.new(attributes['status'])
          @sms_count = attributes['smsCount']
          @message_id = attributes['messageId']
        end
      end
    end
  end
end