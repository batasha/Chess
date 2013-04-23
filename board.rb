require_relative "piece"
require_relative "knight"
require_relative "rook"
require_relative "queen"
require_relative "bishop"
require_relative "king"
require_relative "pawn"


class Board

  attr_accessor :size, :grid

  BACK_ROW = [Rook, Knight,
             Bishop, Queen,
             King, Bishop,
             Knight, Rook]

  def initialize(size = 8)
    @size = size
    @grid = Array.new(size) {Array.new(size)}
  end

  def board_setup
    set_pawns
    set_backrows
  end

  def set_pawns
    self.size.times do |i|
      @grid[1][i] = Pawn.new([1,i], :wh)
      @grid[-2][i] = Pawn.new([-2,i], :bl)
    end
  end

  def set_backrows
    self.size.times do |i|
      @grid[0][i] = BACK_ROW[i].new([0,i], :wh)
      @grid[-1][i] = BACK_ROW[i].new([-1,i], :bl)
    end
  end

  def display
    p @grid
  end

  def move(source, dest) # RENAME
    piece = get_spot(source) unless get_spot(source).nil?
    if piece.poss_moves.include?(dest)
      self.set_spot(piece, dest)
      self.nil_spot(source)
      piece.pos = dest
    else
      raise IllegalMove
    end
  end

  def legal_move(source, dest)
    begin
      move(source, dest)
    rescue IllegalMove => e
      puts "That's an illegal move"
    end
  end


  def nil_spot(pos)
     self.set_spot(nil, pos)
  end

  def set_spot(to_put, pos)
    x,y = pos
    self.grid[x][y] = to_put
  end

  def get_spot(pos)
    x, y = pos
    self.grid[x][y]
  end

end


class IllegalMove < StandardError
end