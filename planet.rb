#! /usr/bin/env ruby
require 'csv'
require 'awesome_print'

# A hash to keep track of all our planets,
# indexed by the downcase name of the planets
# The leading '$' indicates this is a global variable
$planets = {}

class Planet
  attr_reader :name, :mass, :distance_from_sun

  def initialize(name, mass, distance_from_sun)
    @name = name
    @mass = mass
    @distance_from_sun = distance_from_sun
    puts "Planet #{@name} created"
  end

  def to_s()
    "#{@name}: #{@mass} Earth masses, #{@distance_from_sun} AU from sun"
  end
end

def load_planet_data()
  CSV.open('planet_data.csv', 'r').each do |line|
    puts "Planet #{line[1]}, mass #{line[2]}, distance #{line[3]}"
    $planets[line[1].downcase] = Planet.new(line[1], line[2], line[3])
  end
end

def main()
  # Load planets from disk
  load_planet_data()

  # awesome_print our planets, for debugging
  ap $planets

  # Get names explicitly to preserve capitalization
  # (hash indices are downcased)
  names = []
  $planets.each do |name, planet|
    names.push planet.name
  end
  puts "There are many planets: #{names.join(", ")}. Ask me about one!"

  # Get a planet from the user
  input = gets.chomp.downcase
  while !$planets.keys.include? input
    puts "Please ask me about a planet"
    input = gets.chomp.downcase
  end

  # Display info on the planet
  puts "Here's what I know about #{input}:"
  puts $planets[input]
end

# Don't worry too much about this
# The idea is to only run this code if
# this file has been run directly from
# the command line, via
#     $ ruby planet.rb
if __FILE__ == $0
  main()
end
