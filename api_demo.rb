require 'json'
require 'open-uri'
require 'byebug'

# TODO - Let's fetch name and bio from a given GitHub username
BASE_URL = 'https://api.github.com'

puts "What's your Github username?"
username = gets.chomp

url = "#{BASE_URL}/users/#{username}"

# open(url).read => String
serialized_user = open(url).read

user = JSON.parse(serialized_user)

puts "#{username}, you have #{user["public_repos"]} public repos!"
