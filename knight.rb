require 'piece'

class Knight < Piece

  DELTAS = [[1, 2],
            [2, 1],
            [-1, 2],
            [-1, -2],
            [1, -2],
            [-2, 1],
            [-2, -1],
            [2, -1]]

  def initialize(pos, color)
    super
  end

  def poss_moves(board)
    valid_m = check_onboard(board)

    valid_m.delete_if {|pos| board.spot(pos).color == self.color  }
    # add check_check

  end

  def check_onboard(board)
    valid_m=[]

    DELTAS.each do |dx,dy|
      if (0..board.size).include?( self.pos[0]+dx) && (0..board.size).include?( self.pos[1]+dy)
        valid_m << [self.pos[0] + dx, self.pos[1] + dy]
      end
    end

    valid_m
  end


end