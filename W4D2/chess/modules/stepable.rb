module Stepable
  def moves
    # will return an array with valid pos, should consider if the pos is valid or empty?
    self.move_diffs
  end 

  move_diffs should be array of valid moves for the piece

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
  # to raise error if this is called, we wwant the actual move_diffs to be in the piece class
  end 
end