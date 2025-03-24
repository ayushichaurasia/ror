def user_validation
    print "Please enter your mobile number:"
    number = gets.chomp
    if number.match(/\A[6-9]\d{9}/)
        puts "Valid Mobile Number"
    else
        puts "Invalid Mobile Number!!"
    end
#---------------------------------------------------------------------------------
    print "Please Enter your email: "
    email = gets.chomp
    if email.match(/\A[a-zA-Z0-9._%]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}\z/)
        puts "Your email is valid!"
    else
        puts "Your email is invalid!!"
    end
#---------------------------------------------------------------------------------
    print "Please enter your Name: "
    name = gets.chomp
    if name.match(/\A[A-Za-z\s]+\z/)
        puts "Your name is valid!"
    else
        puts "Your name has invalid characters!"
    end
#---------------------------------------------------------------------------------
    print "Please enter you gender: "
    gender = gets.chomp.upcase
    if gender.match(/\A[M|F]\z/)
        puts "Valid gender!"
    else
        puts "Invalid Gender(only M(Male) or F(female) allowed)!"
    end
#---------------------------------------------------------------------------------
    print "Please enter an amount: "
    amount = gets.chomp
    if amount.match(/\A\d+(\.\d{1,2})?\z/)
        puts "Amount Rs.#{amount} is valid!"
    else
        puts "Amount Rs.#{amount} is Invalid!"
    end
end
user_validation