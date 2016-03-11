require 'infobip/sms_api/version'
require 'infobip/sms_api/errors'
require 'infobip/sms_api/message'
require 'infobip/sms_api/messages'
require 'infobip/sms_api/response'
require 'infobip/sms_api/configuration'
require 'infobip/sms_api/model/base'
require 'infobip/sms_api/model/text_message'
require 'infobip/sms_api/model/binary_message'
require 'infobip/sms_api/model/binary_data'
module Infobip
  module SmsApi

    class << self
      attr_writer :configuration
    end

    def self.configuration
      @configuration ||= Configuration.new
    end

    def self.configure
      yield(configuration)
      configuration.connect
    end

    def self.deliver(*messages)
      raise RequiredArgumentMissingError, 'At least 1 message should be sent' if messages.size == 0
      if messages.size == 1
        Infobip::SmsApi::Messages.send_single(messages.first)
      else
        Infobip::SmsApi::Messages.send_multiple(messages)
      end
    end

  end
end
