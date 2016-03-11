# infobip-sms-api-ruby

[![Build Status](https://travis-ci.org/dkocic/infobip-sms-api-ruby.png)](https://travis-ci.org/dkocic/infobip-sms-api-ruby)

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

### Send single text message
```ruby
message = Infobip::SmsApi::Message.new(from: 'Sender', to: '381650000000', text: "Lorem ipsum...")
response = message.send_text
```

### Send single text message to multiple destinations
```ruby
message = Infobip::SmsApi::Message.new(from: 'Sender', to: ['381650000000','381650000001'], text: "Lorem ipsum...")
response = message.send_text
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dkocic/infobip-sms-api-ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

