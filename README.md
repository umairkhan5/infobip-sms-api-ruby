# infobip-sms-api-ruby

[![Build Status](https://travis-ci.org/dkocic/infobip-sms-api-ruby.png)](https://travis-ci.org/dkocic/infobip-sms-api-ruby)
[![Coverage Status](https://coveralls.io/repos/github/dkocic/infobip-sms-api-ruby/badge.svg?branch=master)](https://coveralls.io/github/dkocic/infobip-sms-api-ruby?branch=master)

Simple API wrapper for Infobip SMS Api (https://dev.infobip.com/)

Notes: 
**This is not offical infobip release**, it's a personal project started because there is no other solution ATM.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'infobip-sms-api-ruby'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install infobip-sms-api-ruby

Run generator:

    rails g infobip:config
    
Generator will create new file config/initializers/infobip_config.rb:

```ruby
Infobip::SmsApi.configure do |config|

  # config.endpoint = 'https://api.infobip.com'

  config.username = '' # Infobip Account Username
  config.password = '' # Infobip Account Password

  # config.debug = false # Log requests and responses

end
```

To successfully use this gem you need to have Infobip account, and you need to set your username and password.

## Usage

```ruby  

text_message = Infobip::SmsApi::TextMessage.new(
  from: 'Sender', 
  to: '31630000000', 
  text: "Lorem ipsum...")  

another_text_message = Infobip::SmsApi::TextMessage.new(
  from: 'Sender', 
  to: ['31630000000', '31630000001'], 
  text: "Lorem ipsum...")  
  
binary_message = Infobip::SmsApi::BinaryMessage.new(
  from:'binary', 
  to: '31630000000', 
  binary: {
    hex: '54 65 73 74 20 6d 65 73 73 61 67 65 2e',
    data_coding: 0,
    esm_class: 0
  })

another_binary_message = Infobip::SmsApi::BinaryMessage.new(
  from:'binary2', 
  to: ['31630000000', '31630000001'], 
  binary: {
    hex: '54 65 73 74 20 6d 65 73 73 61 67 65 2e',
    data_coding: 0,
    esm_class: 0
  })

# Send single text sms message
response = Infobip::SmsApi.deliver(text_message)  
# Send multiple text sms messages
response = Infobip::SmsApi.deliver(text_message, another_text_message)  

# Send single binary sms message
response = Infobip::SmsApi.deliver(binary_message)  
# Send multiple binary sms messages
response = Infobip::SmsApi.deliver(binary_message, another_binary_message)  

success = response.successful?

```


## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dkocic/infobip-sms-api-ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

