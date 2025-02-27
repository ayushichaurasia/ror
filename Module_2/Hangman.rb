class Hangman
  def initialize
    @words = ["People", "Schedule", "Success", "Positivity", "Mischievous"]
    @attempts = 6
    @word = @words.sample.downcase.chars
    @guessed_letters = []
    @display_word = Array.new(@word.length,"_")
  end

  def play
    puts "Welcome to Hnagman Game!"
    while @attempts > 0 && @display_word.include?("_")
      puts "\nWord: " +@display_word.join(" ")
      puts "\nTotal letters: #{@word.length}"
      puts "Attempts left: #{@attempts}"
      puts "Your guessed letters: #{@guessed_letters.join(", ")}"
      puts "Please enter a letter: "
      guess = gets.chomp.downcase

      if valid_guess?(guess)
        guess_check(guess)
      else
        puts "Invalid input. Please enter one letter at a time." 
      end
    end
    game_over
  end

  private

  def valid_guess?(guess)
    guess.match?(/^[a-z]$/) && !@guessed_letters.include?(guess)
  end

  def guess_check(guess)
    @guessed_letters << guess
    if @word.include?(guess)
      @word.each_with_index {|char, index| @display_word[index]=char if char == guess}
      if @display_word.count("_") > 0
      puts "Good going, Guess the next letter!"
      end
    else
      @attempts -= 1
      puts "Uh oh, got the wrong one! No Worries! Try again."
    end
  end

  def game_over
    if @display_word.include?("_")
    puts "\nGame Over! The word was '#{@word.join}'" 
  else
    puts "\nWord: " +@display_word.join(" ")
    puts "\nCongrats Champ! You guessed the word right: '#{@word.join}'"
  end
end
end

Hangman.new.play