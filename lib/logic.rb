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
    guess_arr = guess.split('')

    word_arr.each_index do |index|
      @revealed_arr[index] = word_arr[index] if guess_arr.include? word_arr[index]
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
    @revealed_arr.none? { |char| char == '_' }
  end
end
