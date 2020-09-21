[![EdgePetrol](https://circleci.com/gh/EdgePetrol/simplecov-shield-json.svg?style=shield)](https://app.circleci.com/pipelines/github/EdgePetrol/simplecov-shield-json)
![EdgePetrol](https://github.com/EdgePetrol/coverage/blob/master/simplecov-shield-json/master/badge.svg)

# simplecov-shield-json

Shield JSON formatter for the ruby 1.9+ code coverage gem SimpleCov

## Usage

1. Add simplecov-shield-json to your `Gemfile` and `bundle install`:

        gem 'simplecov-shield-json', require: false

2. Require simplecov-shield-json and set it up as SimpleCov's formatter: 

        require 'simplecov-shield-json'
        SimpleCov.formatter = SimpleCov::Formatter::ShieldJSONFormatter

## Result

Generated badge svg can be found in coverage/badge.svg
