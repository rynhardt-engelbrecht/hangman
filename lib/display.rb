# frozen_string_literal: true

require_relative 'text_output'

# module used to handle any output to the terminal
module Display
  include TextOutput

  def show_user_turn
    puts uncovered_key.join(' ')
    print turn_message(:lives)
    puts turn_message(:enter_control)
    print turn_message(:enter_guess)
  end
end
