require './lib/server_log_parser'
require './lib/log_file_parser'
require './lib/report_generator'
require 'byebug'

if ARGV.length != 1
  puts 'We need exactly one parameter. The name of a file.'
  exit;
end

filename = ARGV[0]
puts "Going to open '#{filename}'"

log_parser = LogFileParser.new(ARGV[0])

logs = log_parser.parse_file

views = ReportGenerator.new(logs)

puts 'List of webpages with most page views ordered from most pages views to less page views'
views.most_views


puts 'List of webpages with most unique page views also ordered'
views.uniq_views




