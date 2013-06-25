class Player

  attr_accessor :quitter

  def initialize
    @quitter = false
  end

end


class HumanPlayer < Player

  def get_move
    puts "Please enter a start position x,y or q for quit:"
    raw_input = gets.chomp
    return :quit if raw_input == "q"

    start_position = raw_input.split(",").map {|el| el.to_i}
    puts "Please enter an end position"
    end_position = gets.chomp.split(",").map {|el| el.to_i}

    [start_position, end_position]
  end

  def take_turn(board)
    raw = self.get_move
    if raw == :quit
      return @quitter = true
    else
      start_pos, end_pos = raw
    end

    board.try_move(start_pos, end_pos)
    board.display
  end

end


class ComputerPlayer < Player

end