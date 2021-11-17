module Slidable
  HORIZONTAL_DIRS = [[0, 1], [-1, 0], [0, -1], [1, 0]]
  DIAGONAL_DIRS = [[1, 1], [-1, -1], [1, -1], [-1, 1]]

  def moves 
    possible_moves = []
    move_dirs.each do |move|
      row, col = move
      if grow_unblocked_moves_in_dir(row, col)
        possible_moves << move
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

  def grow_unblocked_moves_in_dir(row, col)
    if self.board[[row, col]].is_a?(NullPiece)
      return true
    end

    false
  end
end