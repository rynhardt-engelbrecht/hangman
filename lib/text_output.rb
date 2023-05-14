# frozen_string_literal: true

# module to handle messages to the user
module TextOutput
  def game_message(message)
    {
      quit: 'Exiting now...',
      save: 'Current session has been saved.',
      save_prompt: 'Would you like to save the session before quitting?',
      load: 'Previous session has been loaded.',
      load_prompt: 'Would you like to load the last saved session?',
      win: 'Congratulations! You successfully guessed the word.',
      lose: "Game over... You could not guess the word. The word was: #{key}"
    }[message]
  end
  def turn_message; end
  def error_message; end
end