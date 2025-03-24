module ApplicationHelper
    def financial_years_options
      current_year = Date.today.year
      month = Date.today.month

      start_year = (month < 4) ? current_year - 1 : current_year
      
      (0..2).map do |i|
        year = start_year - i
        ["#{year}-#{year+1}", "#{year}-#{year+1}"]
      end
    end
  end