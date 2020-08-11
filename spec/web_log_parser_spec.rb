# frozen_string_literal: true

require 'spec_helper'
require './web_log_parser'

RSpec.describe WebLogParser do
  context 'when the same URLs have more than one visits from the same IP' do
    subject { described_class.new('spec/fixtures/webserver_with_same_ip.log') }

    include_examples 'prepare logs to DB', 6

    it 'returns correct count and order' do
      expected_result = [
        { 'url' => '/url/else', 'unique_views' => 2 },
        { 'url' => '/url/here', 'unique_views' => 1 },
        { 'url' => '/url/there', 'unique_views' => 1 }
      ]
      subject.run
      expect(subject.results).to eq(expected_result)
    end
  end

  context 'when the same IP address visit'

  context 'when the all URLs have distinct visits' do
    subject { described_class.new('spec/fixtures/webserver.log') }

    include_examples 'prepare logs to DB', 7

    it 'returns correct count and order' do
      expected_result = [
        { 'url' => '/url/a', 'unique_views' => 3 },
        { 'url' => '/url/c', 'unique_views' => 3 },
        { 'url' => '/url/b', 'unique_views' => 1 }
      ]
      subject.run
      expect(subject.results).to eq(expected_result)
    end
  end
end
