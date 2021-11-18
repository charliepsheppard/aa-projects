require_relative "../filepath"
module Slidable
  HORIZONTAL_DIRS = [[0, 1], [-1, 0], [0, -1], [1, 0]]
  DIAGONAL_DIRS = [[1, 1], [-1, -1], [1, -1], [-1, 1]]

  def moves 
    possible_moves = []
    move_dirs.each do |move|
      row = move[0] + pos[0]
      col = move[1] + pos[1]
      if row.between?(0..7) && col.between?(0..7)
        next_pos = [row, col] 
        possible_moves << next_pos if grow_unblocked_moves_in_dir?(row, col)
      else 
        raise "outside the board range"
      end 

    end

    possible_moves
  end

  def horizontal_dirs
    HORIZONTAL_DIRS
  end 
  def diagonal_dirs
    DIAGONAL_DIRS
  end

  private

  def move_dirs
    raise "wrong method called"
  end

  def grow_unblocked_moves_in_dir?(row, col)
    if self.board[[row, col]].is_a?(NullPiece)
      return true
    end

    false
  end
end