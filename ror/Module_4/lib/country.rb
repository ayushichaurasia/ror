require 'json'

class Country

    GDP_VALUE = 5500000
    ARMY_STRENGTH_VALUE = 1000000

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
        begin
        file = File.read("data/country.json", encoding: "utf-8")
        countries_data = JSON.parse(file)
        countries_data.map {|data| Country.new(data)}
        rescue Errno::ENOENT
            puts "Error: The file 'data/country.json' not found."
            []
            rescue JSON::ParserError
                puts "Error: The file country.json is not valid or maybe have corrupted data. Please check and try again!"
                []
            end
    end
end
