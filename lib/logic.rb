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
    if guess.length == 1
      word_arr = @word.split('')
      word_arr.each_with_index do |item, index|
        @revealed_arr[index] = guess if item == guess
      end
    end
  end

  def play
    @guess_count.times do |guess_num|
      puts 'Enter your guess>>'
      guess = make_guess
      check_guess(guess)
      show_revealed
    end
  end
end
