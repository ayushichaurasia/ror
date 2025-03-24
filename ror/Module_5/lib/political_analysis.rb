class PoliticalAnalysis < Country
    def security_council_eligibility?
      gdp > 5500000 && army_strength > 1000000
    end
  end
  