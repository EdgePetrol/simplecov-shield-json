# frozen_string_literal: true

require 'simplecov'
require 'json'
require 'open-uri'
require_relative 'simplecov-shield-json/version'

module SimpleCov
  module Formatter
    # shield json generator
    class ShieldJSONFormatter
      def format(result)
        shield_url = shield_json(result)

        File.open(output_filepath, 'w+') do |file|
          file.puts URI.open(shield_url).read
        end

        puts output_message(result)

        shield_url
      end

      private

      def output_filename
        'badge.svg'
      end

      def output_filepath
        File.join(output_path, output_filename)
      end

      def output_message(result)
        "Coverage report generated for #{result.command_name} to #{output_filepath}.  \
        #{result.covered_lines} / #{result.total_lines} LOC (#{result.covered_percent.round(2)}%) covered."
      end

      def output_path
        SimpleCov.coverage_path
      end

      def color(coverage_percent)
        case coverage_percent
        when 90..100
          'brightgreen'
        when 80..89
          'yellow'
        else
          'red'
        end
      end

      def shield_json(result)
        "https://img.shields.io/badge/Coverage-#{result.covered_percent.round(2)}#{CGI.escape('%')}-#{color(result.covered_percent)}.svg"
      end
    end
  end
end
