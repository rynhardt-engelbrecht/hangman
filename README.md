# Hangman

<em>"Hangman is a guessing game for two or more players. One player thinks of a word, phrase or sentence and the other(s) tries to guess it by suggesting letters within a certain number of guesses. Originally a Paper-and-pencil game, there are now electronic versions." ~ Wikipedia</em>

# The Game

This is a command-line hangman game. In this game, you need to guess a hidden word by guessing individual letters or the entire word. You have a limited number of chances to guess the word before
the game ends. Let's get this started!

 1. Running the Game:
  - Make sure you have ruby installed on your system.
  - Open your terminal.
  - Run the following command to start the game:
    `ruby <directory_path>/lib/main.rb` (Replace <directory_path> with the path to where the folder of this program is stored.)
 2. Gameplay:
  - The game will represent you with a series of dashes representing the letters of the hidden word
  and a list of your previous guesses.
  - Each turn, you can do one of the following:
   - Guess a single letter or the entire word by entering it and pressing Enter.
   - Enter one of the following to perform an action:
    - 'q;' or 'quit;' - Quit the game.
    - 's;' or 'save;' - Save the current session.
  - After each guess, the game will display a message indicating whether your guess was correct or not.
  - The game will continue until you guess the word correctly, run out of chances, or choose to quit the game.
 3. Valid inputs:
  - When guessing a single letter, enter a valid alphabetic character that you haven't guessed before.
  - When guessing the entire word, enter a word of the same length as the hidden word, consisting only of alphabetic characters and not previously guessed.
  - If you enter an invalid input, you will be prompted to enter a valid one.

# Have fun!

Enjoy playing the hangman game and try to guess the hidden words with the fewest number of errors!
