require_relative "piece"
class Board
  attr_accessor :gird
  def initialize
    @grid= Array.new(8) { Array.new(8, "_") }
    (0...8).each do |row|
      (0...8).each do |col|
        pos = [row, col]
        color = :Black
        board = @grid.dup
        piece = Piece.new(color, board, pos)
        symbol = piece.color
        if !row.between?(2,5)
          add_piece(symbol, pos)
        end 
      end 
    end 
   
  end

  def [](pos)
    row, col = pos 
    @grid[row][col]
  end 

  def []=(pos, val)
    row, col = pos 
    @grid[row][col] = val
  end 

  def move_piece(color, start_pos, end_pos)
      if self[start_pos] == "_"
        raise " no piece at this position"
      elsif 
        self[end_pos] != "_"
        raise "the piece cannot move to this position"
      else 
        self[end_pos] = color
        self[start_pos] = "_"
      end 

  end 

  def add_piece(piece, pos)

    self[pos] = piece 

  end 
  

end

chess = Board.new
p chess 

p chess.move_piece(:black, [0,0], [2,2])
puts "-------------"
p chess
puts "-------------"
p chess.move_piece(:black, [3,3], [2,2])
puts "-------------"
p chess
puts "-------------"
p chess.move_piece(:black, [1,1], [1,2])