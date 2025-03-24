def grades
    print "Please enter a grade:"
    g = gets.to_i
    if g>=1 && g<=5
        puts "Elementry"
    elsif g>=6 && g<=8
        puts "Middle School"
    elsif g>=9 && g<=12
        puts "High School"
    elsif g > 12
        puts "College"
    else
        puts "Invalid Input"
    end
end
grades