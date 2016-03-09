require 'infobip/sms_api/version'
require 'infobip/sms_api/message'
require 'infobip/sms_api/response'
require 'infobip/sms_api/configuration'

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

  end
end
