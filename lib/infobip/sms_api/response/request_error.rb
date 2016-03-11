module Infobip
  module SmsApi
    module Response
      class RequestError
        attr_reader :service_exception
        def initialize(attributes)
          @service_exception = attributes['serviceException']
        end
      end
    end
  end
end
