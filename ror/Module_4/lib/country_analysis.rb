class Analysis
    def initialize(country)
        @country = country
    end

    def loan_eligibility?
        @country.gdp < Country::GDP_VALUE && @country.status == "developing"
    end

    def security_council_eligibility?
        @country.gdp > Country::GDP_VALUE && @country.army_strength > Country::ARMY_STRENGTH_VALUE
    end

    def war_win_probability?
        @country.army_strength > Country::ARMY_STRENGTH_VALUE && @country.gdp > Country::GDP_VALUE
    end
end
