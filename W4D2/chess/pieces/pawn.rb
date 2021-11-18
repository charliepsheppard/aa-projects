require_relative "piece"
class Pawn
    
    def symbol
        :♙
    end 
    def move 
     possible_moves = []
     row = pos[0]  
     col = pos[1] 
     possible_moves << [row+1, col+1] if board[[row+1, col+1]].is_a?(NullPiece)
        possible_moves << [row-1, col-1] if board[[row-1, col-1]].is_a?(NullPiece)  
        if board[row+forward_steps[0], col+forward_steps[1]].is_a?(NullPiece) 
            possible_moves << [row+forward_steps[0], col+forward_steps[1]] 

        end 

        return possible_moves
       
    end 

    private
    def at_start_row?
        row = pos[0]
        return true if row == 1 || row == 6
        false
   
    end 

    def forward_dir
        [
            [1,0],
            [-1,0]
        ]
    end 

    def forward_steps
        if self.color == :black
            [-1, 0]
        else 
            [1,0]
        end 
    end 

    def side_attacks

        [[1,1], [-1,-1]]
    end 

end