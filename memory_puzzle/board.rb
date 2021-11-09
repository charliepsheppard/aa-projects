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

        (0...@grid.length).each do |row|
            (0...@grid.length).each do |col|
                card = pair_arr.sample 
                # new_card = Card.new(card)
                @grid[row][col] = Card.new(card)
                card_index = pair_arr.index(card)
                pair_arr.delete_at(card_index)    
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

    def won?
      @grid.flatten.all? do |ele|
        ele.face == true
      end
    end

    def [](pos)
      row, col = pos
      @grid[row][col]
    end

    def []=(pos, val)
      row, col = pos
      @grid[row][col] = val
    end

    def reveal(pos)
      if self[pos].face == false
        self[pos].reveal
      end
      p self.render
    end

    #won? should return true if all cards have been revealed.
    #reveal should reveal a Card at guessed_pos (unless it's already face-up, 

    # in which case the method should do nothing). It should also return the value of the card it 
    # revealed (you'll see why later).
end

b = Board.new
# p b 

b.populate 
# p b.won?
b.reveal([0, 0])


# p b.get_values(8)

# p b.render


