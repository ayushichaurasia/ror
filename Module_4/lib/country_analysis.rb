class Analysis
    def initialize(country)
        @country = country
    end

    def loan_eligibility?
        @country.gdp < 5500000 && @country.status == "developing"
    end

    def security_council_elegibility?
        @country.gdp > 5500000 && @country.army_strength > 1000000
    end

    def war_win_probability?
        @country.army_strength > 1000000 && @country.gdp > 1000000
    end
end
