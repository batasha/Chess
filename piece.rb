
class Piece

  @@deltas = []

  attr_accessor :pos, :alive, :color
  alias_method :alive?, :alive

  def initialize(pos, color)
    @pos = pos
    @color = color
    @alive = true
  end

  def move(dest, board)
    @pos = dest if self.poss_moves(board).include?(dest)
  end

  def capture
  end

  def poss_moves(board)
  end

  def check_check(board)
  end

end

# class IllegalMove < StandardError
# end