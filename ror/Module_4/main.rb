require_relative 'lib/country_analysis'
require_relative 'lib/country'

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

if countries.empty?
  puts "No data found!! Exiting...."
  exit
end

loop do
  cli
  choice = gets.chomp.to_i

  case choice
  when 1
    countries.each { |c| puts "#{c.name} - GDP: #{c.gdp}, Status: #{c.status}, Army: #{c.army_strength}" }
  when 2, 3, 4
    puts "\n----------------------------------"
    print "Enter country name: "
    input = gets.chomp.strip.downcase
    
    country = countries.find { |c| c.name.strip.downcase == input }

    if country
      an = Analysis.new(country)
      case choice
      when 2
        puts "----------------------------------"
        puts an.loan_eligibility? ? "#{country.name} is Eligible" : "#{country.name} is Not Eligible"
      when 3
        puts "----------------------------------"
        puts an.security_council_eligibility? ? "#{country.name} is Eligible" : "#{country.name} is Not Eligible"
      when 4
        puts "----------------------------------"
        puts an.war_win_probability? ? "#{country.name} can Win the War" : "#{country.name} Might Lose the war"
      end
    else
      puts "Country not found!"
    end
  when 5
    puts "Exiting...Bye!"
    break
  else
    puts "Invalid choice! Please try again."
  end
end
