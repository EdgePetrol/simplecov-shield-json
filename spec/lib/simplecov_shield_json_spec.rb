# frozen_string_literal: true

require File.expand_path('../../lib/simplecov-shield-json', __dir__)
require File.expand_path('../spec_helper', __dir__)

# rubocop:disable Metrics/BlockLength
describe SimpleCov::Formatter::ShieldJSONFormatter do
  before do
    allow(URI).to receive_message_chain(:open, :read).and_return('<svg></svg>')
  end
  shared_examples 'percentage color' do |percentage, color|
    context 'generating report' do
      before do
        allow(simplecov_result).to receive(:covered_percent).and_return(percentage)
      end

      it "with #{percentage} should return #{color}" do
        expect(described_class.new.format(simplecov_result)).to eq(
          "https://img.shields.io/badge/Coverage-#{percentage}#{CGI.escape('%')}-#{color}.svg"
        )
      end
    end
  end

  it 'should be a class' do
    expect(described_class.new).to be_a SimpleCov::Formatter::ShieldJSONFormatter
  end

  context '#format' do
    let(:simplecov_result) { double('SimpleCov::Result') }

    before do
      allow(simplecov_result).to receive(:command_name).and_return('RSpec')
      allow(simplecov_result).to receive(:covered_lines).and_return(3214)
      allow(simplecov_result).to receive(:total_lines).and_return(2714)
    end

    it_behaves_like 'percentage color', 90.12, 'brightgreen'
    it_behaves_like 'percentage color', 83.09, 'yellow'
    it_behaves_like 'percentage color', 51.98, 'red'
  end
end
# rubocop:enable Metrics/BlockLength
