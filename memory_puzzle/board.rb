require_relative "card.rb"

class Board
    # The Board is responsible for keeping track of all your Cards. 
    # You'll want a grid instance variable to contain Cards. Useful methods:

    def initialize(n=4)
        @grid = Array.new(n) {Array.new(n)}
    end

    #populate should fill the board with a set of shuffled Card pairs

    def populate
        total = (@grid.length ** 2) /  2
        pair_arr = get_values(total)

        @grid.map! do |row|
            row.map! do |ele|
                card = pair_arr.sample 
                ele == Card.new(card)
                
            end
        end

    end

    def get_values(total)
        alpha = ("A".."Z").to_a
        values = []
        until values.length >= total 
            pair = alpha.sample 
            if !values.include?(pair)
                values.push(pair)
            end
        end
        values *= 2
    end

    #render should print out a representation of the Board's current state

    def render
        @grid.map do |row|
            row.map do |ele|
                if ele.face == true 
                    ele.value
                else 
                    " "
                end 
            end
        end
    end

    #won? should return true if all cards have been revealed.
    #reveal should reveal a Card at guessed_pos (unless it's already face-up, 

    # in which case the method should do nothing). It should also return the value of the card it 
    # revealed (you'll see why later).
end

b = Board.new
# p b 

# p b.populate 

p b.get_values(8)

# p b.render


