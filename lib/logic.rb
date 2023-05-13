module GameLogic
  def make_guess
    guess = gets.chomp
    return guess if [1, @word.length].include? guess

    make_guess
  end
end
