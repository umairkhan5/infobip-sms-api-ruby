require 'infobip/sms_api/request/base'
module Infobip
  module SmsApi
    module Request
      class BinaryData < Base

        attr_accessor :hex, :data_coding, :esm_class

        def initialize(attributes)
          @hex = attributes[:hex]
          @data_coding = attributes[:data_coding]
          @esm_class = attributes[:esm_class]
        end
      end
    end
  end
end