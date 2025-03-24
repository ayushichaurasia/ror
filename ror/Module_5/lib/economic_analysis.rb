class EconomicAnalysis < Country
    def loan_eligibility?
      gdp < 5500000 && status == "developing"
    end
  end
  