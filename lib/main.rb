require_relative 'logic'

class Hangman
  include GameLogic

  def initialize(guess_count, word)
    @guess_count = guess_count
    @word = word
    @correct_guesses = Array.new(@word.length, '_')
    @incorrect_guesses = []
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
end
