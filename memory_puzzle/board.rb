class Board
    # The Board is responsible for keeping track of all your Cards. 
    # You'll want a grid instance variable to contain Cards. Useful methods:

    def initialize(n=4)
        @grid = Array.new(n) {Array.new(n)}
    end

    #populate should fill the board with a set of shuffled Card pairs

    def populate
        alpha = ("A".."Z").to_a 
        # @grid.map! do |row|
        #     row.map! do |ele|
                
        #     end
        # end

        total = @grid.length * 2
        while total > 0
          
          value = alpha.sample
          i = 2
          while i > 0
            row = rand(0...@grid.length)
            col = rand(0...@grid.length)
            if @grid[row][col] == nil
              @grid[row][col] = Card.new(value)

              i -= 1
            end
          end
        end
    end

    #render should print out a representation of the Board's current state

    #won? should return true if all cards have been revealed.
    #reveal should reveal a Card at guessed_pos (unless it's already face-up, 

    # in which case the method should do nothing). It should also return the value of the card it 
    # revealed (you'll see why later).
end