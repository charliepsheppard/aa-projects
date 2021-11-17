require_relative "piece"
require_relative "slideable"
class Rook
    include Slideable
    def symbol
        [:♜, :♖]
    end 

    private
    def move_dirs

      self.moves[0]

    end 

    
end