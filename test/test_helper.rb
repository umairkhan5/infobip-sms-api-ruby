#test/test_helper.rb
require 'coveralls'
Coveralls.wear!

require 'infobip/sms_api'
require 'minitest/unit'
require 'minitest/autorun'
require 'webmock/minitest'
require 'vcr'

module Infobip
  module SmsApi
    class TestCase < MiniTest::Test
      def setup
        VCR.configure do |c|
          c.cassette_library_dir = "#{File.dirname(__FILE__)}/fixtures"
          c.hook_into :webmock
        end
        Infobip::SmsApi.configure do |config|
          config.username = 'test'
          config.password = 'test'
        end
      end
    end
  end
end
