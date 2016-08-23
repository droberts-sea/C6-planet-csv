# csv-pronto.rb
require 'csv'
planets = [
  [1,"Mercury", 0.055, 0.4],
  [2, "Venus", 0.815, 0.7],
  [3, "Earth", 1.0, 1.0],
  [4, "Mars", 0.107, 1.5]
]
CSV.open("planet_data.csv", "w") do |file|
  planets.each do |planet|
    file << planet
  end
end
