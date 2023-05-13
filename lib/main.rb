class Hangman
  def initialize(guesses, word)
    @guesses = guesses
    @word = word
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
