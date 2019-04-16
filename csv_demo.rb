require 'csv'
require 'byebug'

# TODO - let's read/write data from beers.csv
filepath    = 'data/beers.csv'


# PARSING (LOADING INTO MEMORY)
beers = []
csv_options = {
  col_sep: ',',
  quote_char: '"',
  force_quotes: true,
  headers: :first_row
}

CSV.foreach(filepath, csv_options) do |row|
  beer = {
    name: row["Name"],
    appearance: row["Appearance"],
    origin: row["Origin"]
  }
  beers << beer
end

# beers Array has all the beers in the CSV


# ASK USER FOR A NEW BEER
puts "What's the name of the beer?"
name = gets.chomp

puts "What's the appearance of the beer?"
appearance = gets.chomp

puts "What's the origin of the beer?"
origin = gets.chomp

beer = {
  name: name,
  origin: origin,
  appearance: appearance
}

# push new beer into beers Array (memory of the program)
beers << beer

# STORE ALL THE BEERS (PERSISTING DATA)
# this includes the new beer
CSV.open(filepath, 'wb', csv_options) do |csv|
  csv << ["Name", "Appearance", "Origin"]
  beers.each do |beer|
    csv << [beer[:name], beer[:appearance], beer[:origin]]
  end
end






