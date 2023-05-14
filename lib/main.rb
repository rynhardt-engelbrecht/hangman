# frozen_string_literal: true

require_relative 'game'

# class connecting other files
def start_game
  if File.exist? JSON_FILE_PATH
    puts 'Would you like to load the last saved session? (y/n)'
    input = gets.chomp.downcase
    session = Game.from_json if input == 'y'
  end

  session = Game.new(6, Game.random_key, []) if session.nil?
  session.play
end

start_game
