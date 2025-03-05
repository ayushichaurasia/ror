require 'json'

class Country
    attr_reader :name, :population, :gdp, :states, :army_strength, :status

    def initialize(data)
        @name = data["name"].strip
        @population = data["population"].to_i
        @gdp = data["gdp"].to_i
        @states = data["states"].to_i
        @army_strength = data["army_strength"].to_i
        @status = data["status"]
    end

    def self.all
        file = File.read("data/country.json", encoding: "utf-8")
        JSON.parse(file).map {|data| Country.new(data)}
    end
end
