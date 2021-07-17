require 'rss'
require 'open-uri'
require 'optparse'

options = {}

OptionParser.new do |opts|
  opts.banner = "Usage: example.rb [options]"
  opts.on("-u", "--url URI", "Add Url") do |url|
    begin
      URI.open(url) do |rss|
        feed = RSS::Parser.parse(rss)
        puts "Title: #{feed.channel.title}"
        feed.items.each do |item|
          puts "Item: #{item.title} (#{item.link})"
        end
      end
    rescue
      puts 'Error'
    end
  end
end.parse!





