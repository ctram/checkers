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
    puts '###############################################'
    puts "0 1 2 3 4 5 6 7"
    puts '---------------'
    grid.each do |row|
      ui_pos = Game.convert_coord_from_program_to_ui_perspective([row, 0])
      ui_x = ui_pos[0]# need just the x coordinate, y coord is always the same for both UI and program's perspective.
      print "#{ui_x} |"
      row.each do |col|
        pos = [row, col]
        print "#{self[pos].display}"
      end
    end
  end

  def set_up_board
    pieces_black = Array.new{Piece.new(:black, self, "pb")}
    pieces_red = Array.new{Piece.new(:red. self, "pr")}

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
