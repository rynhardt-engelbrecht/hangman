require_relative 'logic'
require 'json'

class Hangman
  attr_accessor :guess_count, :word, :correct_guesses, :incorrect_guesses

  include GameLogic

  def initialize(guess_count, word, correct_guesses = nil, incorrect_guesses = nil)
    @guess_count = guess_count
    @word = word
    @correct_guesses = correct_guesses || Array.new(@word.length, '_')
    @incorrect_guesses = incorrect_guesses || []
  end

  def self.random_word
    dictionary = File.open('dictionary.txt', 'r')
    dictionary_array = []
    until dictionary.eof?
      line = dictionary.readline.chomp
      dictionary_array << line if line.length.between?(5, 12)
    end
    dictionary.close

    dictionary_array.sample
  end

  def to_json
    json_data = {
      guess_count: @guess_count,
      word: @word,
      correct_guesses: @correct_guesses,
      incorrect_guesses: @incorrect_guesses
    }

    File.open('../save_data.json', 'w') do |file|
      file.puts JSON.dump(json_data)
    end
  end

  def self.from_json
    begin
      json_string = File.read('../save_data.json')
    rescue Errno::ENOENT
      puts 'No save data to load from.'
      return
    end

    data = JSON.parse(json_string, symbolize_names: true)
    self.new(data[:guess_count], data[:word], data[:correct_guesses], data[:incorrect_guesses])
  end
end
