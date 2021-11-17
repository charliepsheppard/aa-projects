require_relative "piece"
require_relative "slideable"
class Queen
    include Slideable
    def symbol
        [:♕, :♛]
    end 

    private
    def move_dirs

      self.moves.flatten 

    end 

end

