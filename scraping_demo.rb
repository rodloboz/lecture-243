require 'open-uri'
require 'nokogiri'
require 'byebug'

# Let's scrape recipes from http://www.epicurious.com
BASE_URL = "https://www.last.fm/music/"

puts "What's the artist?"
artist = gets.chomp.strip
query = artist.gsub(/\s+/, "+")

url = BASE_URL + query

html_file = open(url).read

html_doc = Nokogiri::HTML(html_file)

top_tracks = []
html_doc.search('.chartlist-name').each do |element|
  top_tracks << element.text.strip
end

top_albums = []
html_doc.search("p[itemprop='name']").each do |element|
  top_albums << element.text.strip
end

puts "#{artist} TOP TRACKS:"
top_tracks.each_with_index do |track, index|
  puts "#{index + 1} - #{track}"
end

puts "\n"

puts "#{artist} TOP ALBUMS:"
top_albums.each_with_index do |album, index|
  puts "#{index + 1} - #{album}"
end


