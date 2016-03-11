require './test/test_helper'
require 'infobip/sms_api'
require 'infobip/sms_api/model/text_message'
require 'infobip/sms_api/model/binary_message'
module Infobip
  class SmsApiTest < SmsApi::TestCase

    def before_setup
      @text_message = Infobip::SmsApi::TextMessage.new({from:'text', to: '31630000000', text: 'text message'})
      @another_text_message = Infobip::SmsApi::TextMessage.new(from:'text2', to: '31630000000', text: 'another text message')
      @binary_message = Infobip::SmsApi::BinaryMessage.new(from:'binary', to: '31630000000', binary: {
          hex: '54 65 73 74 20 6d 65 73 73 61 67 65 2e',
          data_coding: 0,
          esm_class: 0
      })
      @another_binary_message = Infobip::SmsApi::BinaryMessage.new(from:'binary2', to: '31630000000', binary: {
          hex: '54 65 73 74 20 6d 65 73 73 61 67 65 2e',
          data_coding: 0,
          esm_class: 0
      })
    end

    def test_should_throw_required_argument_missing_error
      assert_raises(Infobip::SmsApi::RequiredArgumentMissingError) { Infobip::SmsApi.deliver }
    end

    def test_should_throw_unknown_argument_error
      assert_raises(Infobip::SmsApi::UnknownArgumentError) { Infobip::SmsApi.deliver(OpenStruct.new) }
    end

    def test_should_send_single_text_message
      VCR.use_cassette('test_single_text_message') do
        response = Infobip::SmsApi.deliver(@text_message)
        assert response.successful?
      end
    end

    def test_should_return_unauthorized
      VCR.use_cassette('test_unauthorized_response') do
        response = Infobip::SmsApi.deliver(@text_message)
        assert !response.successful?
      end
    end

    def test_should_return_missing_to
      VCR.use_cassette('test_missing_to_response') do
        @text_message.to = ''
        response = Infobip::SmsApi.deliver(@text_message)
        assert !response.successful?
      end
    end

    def test_should_return_network_rejected
      VCR.use_cassette('test_network_rejected_response') do
        @text_message.to = '31200000000'
        response = Infobip::SmsApi.deliver(@text_message)
        assert !response.successful?
        status = response.messages.first.status
        assert_equal 'REJECTED_NETWORK', status.name
        assert_equal 'REJECTED', status.group_name
        assert_equal 0, response.sent_messages.size
        assert_equal 1, response.failed_messages.size
      end
    end

    def test_should_send_single_binary_message
      VCR.use_cassette('test_single_binary_message') do
        response = Infobip::SmsApi.deliver(@binary_message)
        assert response.successful?
      end
    end

    def test_should_throw_malformed_argument_error
      assert_raises(Infobip::SmsApi::MalformedArgumentError) { Infobip::SmsApi.deliver(@text_message, @binary_message) }
    end

    def test_should_send_multiple_text_messages
      VCR.use_cassette('test_multiple_text_messages') do
        response = Infobip::SmsApi.deliver(@text_message, @another_text_message)
        assert response.successful?
      end
    end

    def test_should_send_multiple_binary_messages
      VCR.use_cassette('test_multiple_binary_messages') do
        response = Infobip::SmsApi.deliver(@binary_message, @another_binary_message)
        assert response.successful?
      end
    end

  end
end