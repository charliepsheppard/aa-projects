module Slidable
  HORIZONTAL_DIRS = [[0, 1], [-1, 0], [0, -1], [1, 0]]
  DIAGONAL_DIRS = [[1, 1], [-1, -1], [1, -1], [-1, 1]]

  def moves 
    grow_unblocked_moves_in_dir(HORIZONTAL_DIRS, DIAGONAL_DIRS)
  end

  private

  def move_dirs
    if self.symbol == :rook
      moves[0]
    elsif 
      self.symbol == :bishop
        moves[1]
    else
      moves.flatten
    end
  end

  def grow_unblocked_moves_in_dir(dx, dy)
    dx.select { |pos| self.board[pos].is_a?(NullPiece) }
    dy.select { |pos| self.board[pos].is_a?(NullPiece) }

    unblocked_moves = [dx, dy]
  end
end