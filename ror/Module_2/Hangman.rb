class Hangman
  ATTEMPTS = 6

  def initialize
    @words = ["People", "Schedule", "Success", "Positivity", "Mischievous"]
    @attempts = ATTEMPTS
    @word = @words.sample.downcase.chars
    @guessed_letters = []
    @display_word = Array.new(@word.length, "_")
  end

  def play
    puts "Welcome to Hangman Game!"
    
    while @attempts > 0 && @display_word.include?("_")
      puts "\nWord: " + @display_word.join(" ")
      puts "Total letters: #{@word.length}"
      puts "Attempts left: #{@attempts}"
      puts "Your guessed letters: " + @guessed_letters.join(", ")
      print "Please enter a letter: "
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
      @word.each_with_index { |char, index| @display_word[index] = char if char == guess }
      puts "Good going! Guess the next letter!" if @display_word.include?("_")

    else

      @attempts -= 1
      puts "Uh oh, got the wrong one! No worries! Try again."
    end
  end

  def game_over
    if @display_word.include?("_")
      puts "\nGame Over! The word was '#{@word.join}'"
    else
      puts "\nWord: " + @display_word.join(" ")
      puts "\nCongrats Champ! You guessed the word right: '#{@word.join}'"
    end

    restart_game?
  end

  def restart_game?
    print "\nDo you want to play Hangman again? (yes/no): "
    choice = gets.chomp.downcase
    if choice == "yes"
      Hangman.new.play
    else
      puts "Thanks for playing!"
    end
  end
end

Hangman.new.play