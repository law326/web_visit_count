# frozen_string_literal: true

require 'active_record'
require './models/web_log'
require 'erb'

db_config_file = File.read('db/config.yml')
db_config = YAML.load(ERB.new(db_config_file).result)
ActiveRecord::Base.establish_connection(db_config[ENV.fetch('RACK_ENV', 'development')])

class WebLogParser
  attr_reader :results

  def initialize(file_location)
    @file_location = file_location
    @results = []
  end

  def run
    clear_all_logs
    import_logs
    parse
  end

  private

  def clear_all_logs
    WebLog.destroy_all
  end

  def import_logs
    File.open(@file_location).each do |line|
      row = line.split
      WebLog.create(visited_url: row[0], from_ip: row[1])
    end
  end

  def parse
    sql = "
      SELECT DISTINCT(visited_url) AS url, COUNT(DISTINCT(from_ip)) AS unique_views
      FROM web_logs
      GROUP BY visited_url
      ORDER BY COUNT(DISTINCT(from_ip)) DESC;
    "
    query_results = ActiveRecord::Base.connection.execute(sql)
    @results = query_results.to_a
  end
end
