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
end
