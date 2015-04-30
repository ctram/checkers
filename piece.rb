# piece
class Piece

  attr_accessor :color, :board, :pos

  def initialize(color, board, pos)
    self.color = color
    self.board = board
    self.pos = pos
  end

  def move_to(pos)
  end

  def check_that_an_enemy_was_killed


  end

  def remove_from_board
    board.piece_at(self.pos) = nil
  end



end
