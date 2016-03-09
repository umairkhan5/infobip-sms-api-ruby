#test/test_helper.rb
require 'infobip/sms_api'
require 'minitest/autorun'
require 'webmock/minitest'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = '../fixtures'
  c.hook_into :webmock
end