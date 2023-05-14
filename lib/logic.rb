# frozen_string_literal: true

require_relative 'color'
require_relative 'display'

# module to handle main functionality of the game
module GameLogic
  include Colors
  include Display

  EXIT_KEYS = %w[q; exit;].freeze
  SAVE_KEYS = %w[s; save;].freeze
  LOAD_KEYS = %w[l; load;].freeze
  CONTROL_KEYS = [].concat(EXIT_KEYS, SAVE_KEYS, LOAD_KEYS).freeze

  def user_input
    input = gets.chomp.downcase
    if CONTROL_KEYS.include?(input)
      return control_input(input)
    elsif validate_input(input)
      return evaluate_guess(key, input)
    end

    puts 'Invalid input.'
    user_input
  end

  def control_input(input)
    if EXIT_KEYS.include?(input)
      exit
    elsif SAVE_KEYS.include?(input)
      to_json
      game_message('save')
    else
      self.class.from_json
      game_message('load')
    end
  end

  def validate_input(input)
    [1, key.length].include?(input.length) && /^[[:alpha:]+]$/.match?(input)
  end

  def evaluate_guess(key_word, string)
    temp_key = key_word.split('')
    return check_letter(temp_key, string) if string.length == 1

    check_word(string)
  end

  def check_letter(key_word, char)
    if key.include?(char)
      guess_history.push(green(char))
      key_word.each_index do |index|
        uncovered_key[index] = char if key_word[index] == char
      end
    else
      guess_history.push(red(char))
      self.chances_for_error -= 1
    end
  end

  def check_word(string)
    if string == key
      guess_history.push(green(string))
      self.uncovered_key = string.split('')
    else
      guess_history.push(red(string))
      self.chances_for_error -= 1
    end
  end

  def play
    puts 'Enter your guess>>'
    user_input

    play unless chances_for_error < 1 # || win game
  end
end
