module GameLogic
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
end
