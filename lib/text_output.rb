# frozen_string_literal: true

# module to handle messages to the user

# rubocop:disable Layout/LineLength
module TextOutput
  def game_message(message)
    {
      quit: 'Exiting now...',
      save: 'Current session being saved...',
      save_prompt: 'Would you like to save the session before quitting?',
      win: "\nCongratulations! You successfully guessed the word. The word was: #{green(key)}",
      lose: "\nGame over... You could not guess the word. The word was: #{red(key)}"
    }[message]
  end

  def turn_message(message)
    {
      enter_guess: 'Or, enter your guess>>',
      enter_control: "Press either of the following keys:\n - 'q;', 'quit;' to quit the game.\n - 's;', 'save;' to save the current session.",
      lives: "#{chances_for_error} lives remaining. ",
      incorrect_guess: red('Ouh! No luck.'),
      correct_guess: green('Good guess!')
    }[message]
  end

  def error_message(message)
    {
      input: "Please only enter 1 character, an attempt at the whole word. You can't enter previous guesses again."
    }[message]
  end
end
# rubocop:enable Layout/LineLength
