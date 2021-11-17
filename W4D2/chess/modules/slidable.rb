module Slidable
  HORIZONTAL_DIRS = [[0, 1], [-1, 0], [0, -1], [1, 0]]
  DIAGONAL_DIRS = [[1, 1], [-1, -1], [1, -1], [-1, 1]]

  def moves 
    grow_unblocked_moves_in_dir(HORIZONTAL_DIRS, DIAGONAL_DIRS)
  end

  def self.horizontal_dirs
    HORIZONTAL_DIRS
  end 
  def self.diagonal_dirs
    DIAGONAL_DIRS
  end

  private

  def move_dirs
    raise "wrong method called"
  end

  def grow_unblocked_moves_in_dir(dx, dy)
    dx.select { |pos| self.board[pos].is_a?(NullPiece) }
    dy.select { |pos| self.board[pos].is_a?(NullPiece) }

    unblocked_moves = [dx, dy]
  end
end