module Infobip
  module SmsApi
    module Response
      class ServiceException

        attr_reader :message_id, :text

        def initialize(attributes)
          @message_id = attributes['messageId']
          @text = attributes['text']
        end

      end
    end
  end
end