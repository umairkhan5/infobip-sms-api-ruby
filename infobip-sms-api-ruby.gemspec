# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'infobip/sms_api/version'

Gem::Specification.new do |spec|
  spec.name          = "infobip-sms-api-ruby"
  spec.version       = Infobip::SmsApi::VERSION
  spec.authors       = ["dkocic"]
  spec.email         = ["kocicdamir87@gmail.com"]

  spec.summary       = %q{Rails Gem Wrapper for InfoBip SMS API}
  spec.description   = %q{Rails Gem Wrapper for InfoBip SMS API.}
  spec.homepage      = "https://github.com/dkocic/infobip-sms-api-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.8"
  spec.add_development_dependency "vcr", "~> 3.0"
  spec.add_development_dependency "webmock", "~> 1.24"
  spec.add_development_dependency "simplecov", "~> 0.11"
  spec.add_development_dependency "rails", "~> 5.0.0.beta3"

  spec.add_dependency "faraday", "~> 0.9"
  spec.add_dependency "json", "~> 1.8"
end
