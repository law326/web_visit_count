# frozen_string_literal: true

require 'spec_helper'
require 'active_record'
require './models/web_log'

RSpec.describe WebLog do
  subject { build(:web_log, visited_url: '/some/where', from_ip: '1.2.3.4') }
  it { expect(subject).to be_valid }
end
