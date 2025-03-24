def prime_num?(n)
    return false if n<=1

    for i in 2..(n/2)
        return false if n%i == 0
    end
    true
end

puts "please enter a number to check if its Prime or not: "

num = gets.to_i
if prime_num?(num)
    puts "#{num} is a prime number."
else
    puts "#{num} is not a prime number."

end