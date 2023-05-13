# frozen_string_literal: true

require_relative 'display'

# module to handle main functionality of the game
module GameLogic
  # include Display

  EXIT_KEYS = %w[q; exit;]
  SAVE_KEYS = %w[s; save;]
  LOAD_KEYS = %w[l; load;]
  CONTROL_KEYS = EXIT_KEYS.concat(SAVE_KEYS, LOAD_KEYS)

  def user_input
    input = gets.chomp.downcase

    if CONTROL_KEYS.include? input
      EXIT_KEYS.include?(input) ? return : SAVE_KEYS.include?(input) ? to_json : self.class.from_json
    else
      return evaluate_guess(key, input) if [1, key.length].include?(input.length) && /^[[:alpha:]]+$/.match?(input)
      puts "Invalid input."
      user_input
    end
  end

  def evaluate_guess(key_word, string)
    temp_key = key_word.split('')
    return check_letter(temp_key, string) if string.length == 1

    self.guess_history.push(string)
    check_word(temp_key, string)
  end

  def check_letter(key_word, char)
    if key.include?(char)
      key_word.each_index do |index|
        uncovered_key[index] = char if key_word[index] == char
      end
    end
  end

  def check_word(key_word, string)
    uncovered_key = string.split('') if string == key
  end
end
