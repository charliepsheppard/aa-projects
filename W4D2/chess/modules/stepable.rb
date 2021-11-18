require_relative "../filepath"

module Stepable

 def moves 
    possible_moves = []
    move_dirs.each do |move|
      row = move[0] + pos[0]
      col = move[1] + pos[1]
      if row.between?(0..7) && col.between?(0..7)
        next_pos = [row, col] 
        possible_moves << next_pos if board[next_pos].is_a?(NullPiece)
      else 
        raise "outside the board range"
      end 

    end

    possible_moves
  end
   

  def move_diffs
   raise "should call move_diffs from piece"
  
  end 
end