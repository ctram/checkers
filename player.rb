require_relative 'piece'

# player
class Player
  attr_accessor :pieces_in_play, :color, :board

  def initialize(color)
    self.color = color
  end

  def takes_turn
    begin
      chosen_piece = choose_piece
    rescue IncorrectColorChosenError => e
      puts "You must choose a piece that shares your color."
      retry
    rescue NotOnBoardError => e
      puts 'You must choose a square on the board.'
      retry
    end

    begin
      chosen_dest = choose_destination
    rescue NotOnBoardError => e
      puts 'You must choose a square on the board.'
      retry
    rescue OccupiedSquareError => e
      puts 'You cannot land on another piece.'
      retry
    end
  end

  def square_occupied?(pos)
    x, y = pos
    unless board.piece_at(pos) == nil
      raise OccupiedSquareError
      false
    end
    true
  end

  def choose_piece
    puts 'Enter the coordinate of the piece you want to move.'
    pos = gets.chomp.split('')
    pos.map! {|e| e.to_i}
    board.convert_coord_from_ui_to_program_perspective(pos)
  end

  def choose_destination
    puts 'Enter the coordinate of the square you want to land on.'
    pos = gets.chomp.split('')
    pos.map! {|e| e.to_i}
    board.convert_coord_from_ui_to_program_perspective(pos)
  end

  def position_on_board?(pos)
    x, y = pos
    unless x >= 0 and x < board.grid.size and y >= 0 and y < board.grid.size
      raise NotOnBoardError
      false
    end
    true
  end

  def chosen_piece_is_same_team?(pos)
    piece = board.piece_at(pos)
    unless piece.color == color
      raise IncorrectColorChosenError
      false
    end
    true
  end


end
