# encoding: utf-8

class Piece



  attr_accessor :pos, :color, :board


  def initialize(pos, color, board)
    @pos = pos
    @color = color
    @board = board
  end

  # def move(dest, board) # Move into board.
  #   if self.poss_moves(board).include?(dest)
  #     @pos = dest
  #   else
  #     raise IllegalMove
  #   end
  # end

  # def capture
 #  end

  def moves
  end

  def check_check
  end

end
