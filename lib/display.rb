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
    }[type]
  end

  def turn_message(type)
    {
      'guess' => "#{@guess_count} lives remainig.",
      'guess warning' => 'Be careful! You only have 1 life remaining.',
    }[type]
  end

  def error_message(type)
    {
      'guess' => 'Please only enter 1 character or attempt to guess the whole word>>',
      'save/load' => "Please only enter 'y' or 'n'>>",
    }[type]
  end
end
