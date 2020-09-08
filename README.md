[![EdgePetrol](https://circleci.com/gh/EdgePetrol/simplecov-shield-json.svg?style=shield)](https://app.circleci.com/pipelines/github/EdgePetrol/simplecov-shield-json)
![EdgePetrol](https://img.shields.io/endpoint?url=https://edgepetrol.github.io/coverage/simplecov-shield-json/master/shield-coverage.json)

# simplecov-shield-json

Shield JSON formatter for the ruby 1.9+ code coverage gem SimpleCov

## Usage

1. Add simplecov-shield-json to your `Gemfile` and `bundle install`:

        gem 'simplecov-shield-json', require: false

2. Require simplecov-shield-json and set it up as SimpleCov's formatter: 

        require 'simplecov-shield-json'
        SimpleCov.formatter = SimpleCov::Formatter::ShieldJSONFormatter

## Result

Generated JSON can be found in coverage/shield-coverage.json

The format you can expect is:
```
        {
          "schemaVersion": 1,
          "label": "Coverage",
          "message": "99.9%",
          "color": "green",
          "cacheSeconds": 1800
        }
```
