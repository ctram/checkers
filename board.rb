# board



def occupied_at?(pos)


end

def piece_at(pos)
end

def piece_on_board?(pos)
  x_pos, y_pos = pos
  x_pos < board.grid.size && x >= 0 && y_pos < board.grid.size && y_pos >= 0
end
