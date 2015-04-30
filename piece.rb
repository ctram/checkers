# piece
class Piece
  SOLDIER_DIRECTION_DELTAS = [
    [ 1,  1],
    [-1,  1],
  ]

  KING_DIRECTION_DELTAS = {
    [ 1,  1],
    [-1,  1],
    [ 1, -1]
    [-1, -1]
  }

  attr_accessor :color, :board, :pos, :kinged

  def initialize(color, board, pos)
    self.color = color
    self.board = board
    self.pos = pos
    self.kinged = false
  end

  def move_to(pos)

    board.piece_at(self.pos) = nil
    board.piece_at(pos) = self
    self.pos = pos
  end

  def valid_move?(pos)
    # a move is valid is the destination pos does not contain a piece on self's team (same color) and respects the piece's distance rules.
      # Rules are:
      #   A piece can only move more than one square away from it's original position if it can kill an enemy piece, i.e. there is an enemy one step in the direction the piece is moving.
      #
      #
  end

  # returns ARRAY of direction_deltas based on whether the piece is a king or soldier.
  def set_direction_deltas
    kinged ? (direction_deltas = KING_DIRECTION_DELTAS) : (direction_deltas = SOLDIER_DIRECTION_DELTAS)
  end

  def check_that_an_enemy_was_killed
    # an enemy has been killed if, during a piece's jump, the piece passed over an enemy.


  end

  def a_chained_moved?(pos)



  end

  def enemy_would_be_killed_with_this_move?(destination_pos)
    x_start_pos, y_start_pos = self.pos
    x_destination_pos, y_destination_pos = pos

    x_destination_pos > x_start_pos ? x_direction = 1 : x_direction = -1
    y_destination_pos > y_start_pos ? y_direction = 1 : y_direction = -1

    pos_between_destination_and_start_pos = [x_direction, y_direction]
    self.color == :black ? enemy_color = :white : enemy_color = :black
    if board.piece_at(pos_between_destination_and_start_pos).color == enemy_color
      true
    else
      false
    end
  end

  def jump_to(pos)
  end

  def

  def remove_from_board
    board.piece_at(self.pos) = nil
  end



end
