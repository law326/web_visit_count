# frozen_string_literal: true

require './web_log_parser'

file_path = ARGV[0]

parser = WebLogParser.new(file_path)
parser.run
parser.results.each do |result|
  puts "#{result['url']} has #{result['unique_views']} unique views"
end
