require_relative 'lib/country'
require_relative 'lib/economic_analysis'
require_relative 'lib/political_analysis'
require_relative 'lib/military_analysis'

def cli 
  puts "----------------------------------"
  puts "\nWelcome to the Country Data CLI"
  puts "1. List all countries"
  puts "2. Check IMF/WB Loan Eligibility"
  puts "3. Check UN Security Council Seat Eligibility"
  puts "4. Check War Winning Probability"
  puts "5. Exit"
  print "Choose an option: "
  # puts "----------------------------------"
end


countries = Country.all

loop do
  cli
  choice = gets.chomp.to_i

  case choice
  when 1
    countries.each { |c| puts "#{c.name} - GDP: #{c.gdp}, Status: #{c.status}, Army: #{c.army_strength}" }
  when 2
    puts "\n----------------------------------"
    name = gets.chomp.downcase
    country = countries.find { |c| c.name.downcase == name }
    if country
      puts EconomicAnalysis.new(country).loan_eligibility? ? "#{country.name} is Eligible" : "#{country.name} is Not Eligible"
    else
      puts "Country not found!"
    end
  when 3
    print "Enter country name: "
    name = gets.chomp.downcase
    country = countries.find { |c| c.name.downcase == name }
    if country
      puts PoliticalAnalysis.new(country).security_council_eligibility? ? "#{country.name} is Eligible" : "#{country.name} is Not Eligible"
    else
      puts "Country not found!"
    end
  when 4
    print "Enter country name: "
    name = gets.chomp.downcase
    country = countries.find { |c| c.name.downcase == name }
    if country
      puts MilitaryAnalysis.new(country).war_win_probability? ? "#{country.name} can Win the War" : "#{country.name} Might Lose the war"
    else
      puts "Country not found!"
    end
  when 5
    puts "Exiting...Bye"
    break
  else
    puts "Invalid choice! Please try again."
  end
end
