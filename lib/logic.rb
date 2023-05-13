require_relative 'display'

module GameLogic
  include Display

  def make_guess
    guess = gets.chomp.downcase
    return guess if [1, @word.length].include? guess.length

    puts 'Invalid input.'
    make_guess
  end

  def update_correct_guesses(guess)
    word_arr = @word.split('')
    if guess.length == 1
      word_arr.each_index do |index|
        word_arr[index] == guess ? @correct_guesses[index] = guess : @incorrect_guesses << guess
      end
    else
      guess_arr = guess.split('')
      guess_arr == word_arr ? @correct_guesses = guess_arr : @incorrect_guesses << guess
    end
  end

  def play
    @guess_count.times do |guess_num|
      puts 'Enter your guess>>'
      guess = make_guess
      update_correct_guesses(guess)
      show_revealed

      break if win_game?(guess)
    end
  end

  def win_game?(guess)
    @correct_guesses.none? { |char| char == '_' }
  end
end
