# frozen_string_literal: true

FactoryBot.define do
  factory :web_log do
    sequence(:visited_url) { |n| "/url/#{n}" }
    sequence(:from_ip) { |n| "192.168.0.#{n}" }
  end
end
