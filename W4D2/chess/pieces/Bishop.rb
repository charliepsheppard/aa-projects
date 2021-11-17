require_relative "piece"
require_relative "slideable"
class Bishop
    include Slideable
    def symbol
        [:♝, :♗]
    end 

    private
    def move_dirs

      self.moves[1]

    end 

    
end