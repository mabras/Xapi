# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'xapi/version'

Gem::Specification.new do |spec|
  spec.name          = "xapi"
  spec.version       = Xapi::VERSION
  spec.authors       = ["GrowthTribe"]
  spec.email         = ["dev@growthtribe.nl"]
  spec.summary       = "A Ruby library for implementing xAPIs."
  spec.description   = %q{A Ruby library for interacting with a Learning Record Store (LRS) using the xAPI). Forked and extended from https://github.com/Deakin-Prime/Xapi created by kodandapani.k@comakeit.com}
  spec.homepage      = 'https://github.com/growthtribeacademy/Xapi'
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'webmock', '~> 3.0.0'

  spec.add_runtime_dependency 'faraday', '~> 2.2'
  spec.add_runtime_dependency 'addressable', '~> 2.3'
  spec.add_runtime_dependency 'activesupport', '>= 5.1'
end
