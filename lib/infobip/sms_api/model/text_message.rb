require 'infobip/sms_api/model/binary_data'
module Infobip
  module SmsApi
    class TextMessage < Base

      attr_accessor :from, :to, :text

      def initialize(attributes)
        @from = attributes[:from]
        @to = attributes[:to]
        @text = attributes[:text]
      end

    end
  end
end
