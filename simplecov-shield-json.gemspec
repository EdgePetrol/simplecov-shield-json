# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)
require 'simplecov-shield-json/version'

Gem::Specification.new do |s|
  s.name        = 'simplecov-shield-json'
  s.version     = SimpleCov::Formatter::ShieldJSONFormatter::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Guilherme Pereira']
  s.email       = ['guilherme.pereira@edgepetrol.com']
  s.homepage    = 'https://github.com/EdgePetrol/simplecov-shield-json'
  s.license     = 'MIT'
  s.summary     = %({Shield JSON formatter for SimpleCov})
  s.description = %({Shield JSON formatter for SimpleCov code coverage tool for ruby 1.9+})
  s.required_ruby_version = '>= 2.4.0'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ['lib']

  s.add_dependency 'json'
  s.add_dependency 'simplecov'

  s.add_development_dependency 'bundler', '~> 2.1'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec', '~> 3.4'
  s.add_development_dependency 'rubocop', '~> 0.85.1'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'simplecov-json'
end
