# board
require 'piece'

class Board
  attr_accessor :grid



  def initialize
    self.grid = Array.new(8){Array.new(8){}}
  end

  def [](pos)
    x, y = pos
    grid[x][y]
  end
  def []=(pos, arg)
    x, y = pos
    grid[x][y] = arg
  end

  def occupied_at?(pos)
  end

  def piece_at(pos)
  end

  def piece_on_board?(pos)
    x_pos, y_pos = pos
    x_pos < board.grid.size && x >= 0 && y_pos < board.grid.size && y_pos >= 0
  end

  def render

  end
  
  def set_up_board
    pieces_black = Array.new{Piece.new(:black, self)}
    pieces_red = Array.new{Piece.new(:red. self)}

    # setup black pieces
    offset = true
    3.times do |row|
      4.times do |col|
        col += 1 if offset
        pos = [row, col]
        piece = pieces_black.pop
        piece.pos = pos
        board[pos] = piece
      end
      offset = !offset
    end

    # setup red pieces
    offset = false
    3.times do |row|
      row = row + 5
      4.times do |col|
        col += 1 if offset
        pos = [row, col]
        piece = pieces_black.pop
        piece.pos = pos
        board[pos] = piece
      end
      offset = !offset
    end
  end


end
