module Display
  def show_game_state
    print "\nWord: #{@correct_guesses.join}"
    puts "  Incorrect guesses: #{@incorrect_guesses.join(', ')}\n"
  end
end
