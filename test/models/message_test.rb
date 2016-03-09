require '../test_helper'

class MessageTest < Minitest::Test

  def setup
    Infobip::SmsApi.configure do |configuration|
      configuration.username = 'test'
      configuration.password = 'test'
    end
  end

  def test_exists
    assert Infobip::SmsApi::Message
  end

  def test_single_network_rejected
    VCR.use_cassette('test_single_network_rejected') do
      message = Infobip::SmsApi::Message.new(from: 'Test', to: '381203136825', text: 'Testing')
      response = message.send_text
      assert_equal Infobip::SmsApi::Response::Base, response.class
      assert !response.successful?
      status = response.messages.first.status
      assert_equal 'REJECTED_NETWORK', status.name
      assert_equal 'REJECTED', status.group_name
    end
  end

  def test_single_missing_to
    VCR.use_cassette('test_single_missing_to') do
      message = Infobip::SmsApi::Message.new(from: 'Test', to: '', text: 'Testing')
      response = message.send_text
      assert_equal Infobip::SmsApi::Response::Base, response.class
      assert !response.successful?
      status = response.messages.first.status
      assert_equal 'MISSING_TO', status.name
      assert_equal 'REJECTED', status.group_name
    end
  end

  def test_single_pending
    VCR.use_cassette('test_single_pending') do
      message = Infobip::SmsApi::Message.new(from: 'Test', to: '31633136825', text: 'Testing')
      response = message.send_text
      assert_equal Infobip::SmsApi::Response::Base, response.class
      assert response.successful?
      status = response.messages.first.status
      assert_equal 'PENDING_ENROUTE', status.name
      assert_equal 'PENDING', status.group_name
    end
  end
end