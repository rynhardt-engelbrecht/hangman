module Display
  def show_game_state
    print "\nWord: #{@correct_guesses.join}"
    puts "  Incorrect guesses: #{@incorrect_guesses.join(', ')}\n"
  end

  def game_message(type)
    {
      'save prompt' => "Would you like to save the current session? Enter 'y' or 'n'>>",
      'saved' => 'Current session has been saved.',
      'load prompt' => "Would you like to load the previous session? Enter 'y' or 'n'>>",
      'loaded' => 'Previous session has been loaded.',
      'quit' => 'Exiting...',
      'win' => 'Congratulations! You guessed the word and survived!',
      'lose' => 'Game over... You couldn\'t guess the word and the stickman was hanged.'
    }
  end
end
