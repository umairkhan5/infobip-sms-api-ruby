module Infobip
  module SmsApi
    module Request
      class BinaryMessage < Base

        attr_accessor :from, :to, :binary

        def initialize(attributes)
          @from = attributes[:from]
          @to = attributes[:to]
          @binary = BinaryData.new(attributes[:binary])
        end

      end
    end
  end
end
