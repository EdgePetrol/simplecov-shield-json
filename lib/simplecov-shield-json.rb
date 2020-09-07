# frozen_string_literal: true

require 'simplecov'
require 'json'
require_relative 'simplecov-shield-json/version'

module SimpleCov
  module Formatter
    # shield json generator
    class ShieldJSONFormatter
      def format(result)
        json = shield_json(result)

        File.open(output_filepath, 'w+') do |file|
          file.puts json
        end

        puts output_message(result)

        json
      end

      private

      def output_filename
        'shield-coverage.json'
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
        {
          schemaVersion: 1,
          label: 'Coverage',
          message: "#{result.covered_percent.round(2)}%",
          color: color(result.covered_percent),
          cacheSeconds: 1800
        }.to_json
      end
    end
  end
end
