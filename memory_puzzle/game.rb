require_relative "card.rb"
require_relative "board.rb"

class Game
    # The Game should have instance variable for the Board and the previously-guessed position (if any). 
    # It should also have methods for managing the Board-Player interaction. You may want a play 
    # loop that runs until the game is over. Inside the loop, you should render the board, prompt 
    # the player for input, and get a guessed pos. Pass this pos to a make_guess method, where you 
    # will handle the actual memory/matching logic. Some tips on implementing this:

    def initialize(num)
        @board = Board.new(num)
        @guesses = []
    end

    def play 
        until @board.won?
            @board.print
            puts "please enter a position for the card you would like to flip over"
            response = gets.chomp.split(" ").map(&:to_i)
            raise "Invalid guess,try again" if response.length != 2
            self.make_guess(response)
        end
    end


    # If we're not already checking another Card, leave the card at guessed_pos face-up 
    # and update the previous_guess variable.

    def make_guess(pos)
        if @guesses.length < 2
            @guesses << pos
            self.reveal_and_print(pos)
        else 
            @guesses << pos
            self.reveal_and_print(pos)
            self.match?(array)
        end
    end

    def reveal_and_print(pos)
        @board[pos].reveal
        @board.print
    end

    def match?(arr)
        first,last = arr[0], arr[1]
        @board[first].value == @board[last].value 
    end


    # If we are checking another card, we should compare the Card at guessed_pos with the one at previous_guess.

    # If the cards match, we should leave them both face-up.
    # Else, flip both cards face-down.
    # In either case, reset previous_guess.


end