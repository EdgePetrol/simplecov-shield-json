# frozen_string_literal: true

require File.expand_path('../../lib/simplecov-shield-json', __dir__)
require File.expand_path('../spec_helper', __dir__)

describe SimpleCov::Formatter::ShieldJSONFormatter do
  it 'should be a class' do
    expect(described_class.new).to be_a SimpleCov::Formatter::ShieldJSONFormatter
  end
end
