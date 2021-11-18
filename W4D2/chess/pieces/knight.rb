require_relative "piece"
require_relative "stepable"
class Knight
    include Stepable
    def symbol
        :♘
    end 

    protected
    def move_diffs
      [
        [1, 2], 
        [2, 1], 
        [2, -1], 
        [1, -2], 
        [-1, -2], 
        [-2, -1], 
        [-2, 1], 
        [-1, 2]
                ]
    end 

end