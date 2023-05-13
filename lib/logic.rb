require_relative 'display'

module GameLogic
  include Display

  def make_guess
    guess = gets.chomp.downcase
    return guess if [1, @word.length].include? guess.length

    puts 'Invalid input.'
    make_guess
  end

  def check_guess(guess)
    word_arr = @word.split('')
    guess.length == 1 ? check_letter(word_arr, guess) : check_word(word_arr, guess)
  end

  def check_letter(word_arr, guess)
    if word_arr.include? guess
      word_arr.each_index { |index| @correct_guesses[index] = guess if word_arr[index] == guess }
    else
      @incorrect_guesses << guess
    end
  end

  def check_word(word_arr, guess)
    guess_arr = guess.split('')
    guess_arr == word_arr ? @correct_guesses = guess_arr : @incorrect_guesses << guess
  end

  def play
    puts "\nGuesses remaining: #{@guess_count}; Enter your guess>>"
    guess = make_guess
    check_guess(guess)
    show_game_state

    play unless win_game? || lose_game? || @guess_count < 1
  end

  def win_game?
    @correct_guesses.none? { |char| char == '_' }
  end

  def lose_game?
    @incorrect_guesses.length == 6
  end
end
