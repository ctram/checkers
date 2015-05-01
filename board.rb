# board
require_relative 'piece'

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
    self[pos]
  end

  def piece_on_board?(pos)
    x_pos, y_pos = pos
    x_pos < grid.size && x >= 0 && y_pos < grid.size && y_pos >= 0
  end

  def render
    puts '###############################################'
    puts '-------------------------'
    alternator = true
    grid.each_with_index do |row, r_idx|
      ui_pos = convert_coord_from_program_to_ui_perspective([r_idx, 0])
      ui_x = ui_pos[0]# need just the x coordinate, y coord is always the same for both UI and program's perspective.
      print "#{ui_x} |"
      alternator ? every_other = true : every_other = false
      row.each_with_index do |col, c_idx|
        pos = [r_idx, c_idx]

        if every_other
          if self[pos] == nil
            print colorize_w_bg("   ", :white, :red)
          else
            print colorize_w_bg("#{self[pos].display}", self[pos].color, :red)
          end
        else
          if self[pos] == nil
            print colorize_w_bg("   ", :white, :black)
          else
            print colorize_w_bg("#{self[pos].display}", self[pos].color, :black)
          end
        end
        every_other = !every_other
      end
      alternator = !alternator
      puts
    end
    puts '-------------------------'
    puts "   0  1  2  3  4  5  6  7"

  end

  def colorize_w_bg(output, piece_color,  bg_color)
    output.colorize(color: piece_color, background: bg_color)
  end

  def convert_coord_from_program_to_ui_perspective(coor)
    program_x, program_y = coor
    ui_x = grid.size - program_x - 1
    ui_y = program_y
    [ui_x, ui_y]
  end

  def convert_coord_from_ui_to_program_perspective(coor)
    # program_x + grid.size - (program_x + (program_x + 1))
    # (grid.size - 1 - program_x) <= to get from program_x to x_ui
    ui_x, ui_y = coor
    program_x = grid.size - ui_x - 1
    program_y = ui_x
    [program_x, program_y]
  end

  def num_pieces_on_board
    #byebug
    num_pieces = grid.select do |row|
      row.select do |col|
        col.is_a?(Piece)
      end
    end
    num_pieces.count
  end

  def on_board?(pos)
  end
end
