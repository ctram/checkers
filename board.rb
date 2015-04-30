# board

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

  def set_up_board

  end

  def convert_coord_for_ui_perspective(coor)
    # program_x + grid.size - (program_x + (program_x + 1))
    # (grid.size - 1 - program_x) <= to get from program_x to x_ui
    ui_x, ui_y = coor
    program_x = grid.size - ui_x - 1
    program_y = ui_x
    [program_x, program_y]
  end
end
