# frozen_string_literal: true

class WebLog < ActiveRecord::Base
  validates :visited_url, presence: true
  validates :from_ip, presence: true
end
