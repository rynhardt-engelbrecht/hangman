# frozen_string_literal: true

require_relative 'color'
require_relative 'display'
require_relative 'text_output'
require 'io/console'

# module to handle main functionality of the game
module GameLogic
  include Colors
  include Display
  include TextOutput

  EXIT_KEYS = %w[q; exit;].freeze
  SAVE_KEYS = %w[s; save;].freeze
  CONTROL_KEYS = [].concat(EXIT_KEYS, SAVE_KEYS).freeze

  def user_input
    loop do
      input = gets.chomp.downcase
      if CONTROL_KEYS.include?(input)
        return control_input(input)
      elsif validate_input(input)
        @last_guess = input
        return evaluate_guess(key, input)
      end

      puts error_message(:input)
    end
  end

  def control_input(input)
    if EXIT_KEYS.include?(input)
      exit_game
    elsif SAVE_KEYS.include?(input)
      save_game
    end
  end

  def validate_input(input)
    [1, key.length].include?(input.length) && /^[[:alpha:]]+$/.match?(input) && not_in_history?(input)
  end

  def not_in_history?(input)
    !(guess_history.include?(green(input)) || guess_history.include?(red(input)))
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
    loop do
      $stdout.clear_screen
      puts last_guess(@last_guess)
      show_user_turn
      user_input

      break unless game_active?
    end

    puts game_message(:win) if win_game?
    puts game_message(:lose) if lose_game?
  end

  def win_game?
    uncovered_key.none? { |c| c == '-' }
  end

  def game_active?
    !lose_game? && !win_game?
  end

  def lose_game?
    chances_for_error.zero?
  end

  def exit_game
    $stdout.clear_screen
    puts game_message(:quit)
    sleep 1
    exit
  end

  def save_game
    $stdout.clear_screen
    puts game_message(:save)
    sleep 1
    to_json
  end

  def self.load_game
    $stdout.clear_screen
    puts game_message(:save)
    sleep 1
    from_json
  end
end
