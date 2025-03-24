class MilitaryAnalysis < Country
    def war_win_probability?
      army_strength > 1000000 && gdp > 1000000
    end
  end
  