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

  def initialize(color, board, display)
    self.color = color
    self.board = board
    self.kinged = false
    self.diplay = display
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
  def set_direction_deltas_based_on_king_status_and_color
    if kinged
      direction_deltas = KING_DIRECTION_DELTAS
    else
      direction_deltas = SOLDIER_DIRECTION_DELTAS
    end

    # flip the deltas depeneding on which where the pieces are facing.
    self.color == :black ? facing_multiplier = 1 : facing_multiplier = -1

    direction_deltas.each do |delta|
      delta.map! do |index|
        index * facing_multiplier
      end
    end
    direction_deltas
  end


  def a_chained_moved?(s_pos, dest_pos)
    # logic:
    #   determine possible jumps a piece can make
    #   for each jump
    #     if piece has reached destination
    #       return true
    #     else
    #       would the jump result in a kill?
    #         if yes, repeat a_chained_moved
    #         else return false
    possible_jumps_arr = possible_jumps(s_pos)
    possible_jumps_arr.select do |pos|
      if pos == dest_pos and enemy_would_be_killed_with_this_move(pos)
        true
      else
        if enemy_would_be_killed_with_this_move?(pos)
          a_chained_moved(pos, dest_pos)
        else
          false
        end
      end
    end
  end

  def possible_jumps(s_pos)
    direction_deltas = set_direction_deltas_based_on_king_status_and_color
    possible_end_positions = direction_deltas.map do |delta|
      x_start_pos, y_start_pos = s_pos
      x_delta, y_delta = delta
      x_end, y_end = x_start_pos + (x_delta * 2), y_start_pos + (y_delta * 2)
      [x_end, y_end]
    end

    filtered_possible_jumps = possible_end_positions.select do |pos|
      piece_on_board?(pos)
    end
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


  def turn_into_king
    self.kinged = true
    self.color == :red ? color = "b" : color = "r"
    self.display = "K#{color}"
  end

  def remove_from_board
    board.piece_at(self.pos) = nil
  end



end
