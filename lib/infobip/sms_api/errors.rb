module Infobip
  module SmsApi
    class InfobipStandardError < StandardError
    end
    class RequiredArgumentMissingError < InfobipStandardError
    end
    class UnknownArgumentError < InfobipStandardError
    end
    class MalformedArgumentError < InfobipStandardError
    end
  end
end