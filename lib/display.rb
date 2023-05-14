# frozen_string_literal: true

require_relative 'text_output'

# module used to handle any output to the terminal
module Display
  include TextOutput

  def show_user_turn
    print uncovered_key.join(' ')
    puts "  Guess history: #{guess_history.join(', ')}"
    print "\n#{turn_message(:lives)}"
    puts turn_message(:enter_control)
    print turn_message(:enter_guess)
  end

  def last_guess
    return turn_message(:incorrect_guess) if guess_history[-1] == red(@last_guess)

    turn_message(:correct_guess) if guess_history[-1] == green(@last_guess)
  end
end
