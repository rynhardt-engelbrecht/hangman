require_relative 'logic'
require 'json'

ROOT_DIR = File.expand_path('..', __dir__)

# class to contain state of the game
class Game
  attr_accessor :chances_for_error, :guess_history, :key, :uncovered_key

  include GameLogic

  @@JSON_FILE_PATH = File.join(ROOT_DIR, '/data/data.json')

  def initialize(chances_for_error, key, guess_history, uncovered_key = nil)
    @chances_for_error = chances_for_error
    @guess_history = guess_history
    @key = key
    @uncovered_key = uncovered_key || Array.new(key.length, '-')
  end

  private

  def to_json
    json_data = {
      chances_for_error: @chances_for_error,
      key: @key,
      guess_history: @guess_history,
      uncovered_key: @uncovered_key
    }

    File.open(@@JSON_FILE_PATH, 'w') { |file| file.puts JSON.dump(json_data) }
  end

  public

  def self.random_key
    dictionary_path = File.join(ROOT_DIR, 'dictionary.txt')
    dictionary = []
    File.open(dictionary_path) do |file|
      until file.eof?
        line = file.readline.chomp
        dictionary << line if line.length.between?(5, 12)
      end
    end

    dictionary.sample
  end

  def self.from_json
    begin
      json_string = File.read(@@JSON_FILE_PATH)
    rescue Errno::ENOENT
      puts 'No save data to read from.'
      return
    end

    data = JSON.parse(json_string, symbolize_names: true)
    self.new(data[:chances_for_error], data[:key], data[:guess_history], data[:uncovered_key])
  end
end
