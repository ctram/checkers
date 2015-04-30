require 'byebug'
require 'colorize'
require_relative 'board'
require_relative 'player'
# game
class Game
  attr_accessor :player1, :player2, :board

  def initialize(player1, player2)
    self.board = Board.new
    self.player1 = player1
    self.player2 = player2
  end

  def play
    puts "Welcome to Chess!"
    until over?
      board.render
      current_player.takes_turn
      toggle_player
    end
  end

  def player_turn
  end

  def win?

  end

  def over?

  end

  def can_player_kill_an_enemy?
    # To be used later to check whether the player can move again
    # If he has killed an enemy, then he should possibily be able to move again (i.e. he can chain attacks)
  end
  #
  # def Game.convert_coord_from_ui_to_program_perspective(coor)
  #   # program_x + grid.size - (program_x + (program_x + 1))
  #   # (grid.size - 1 - program_x) <= to get from program_x to x_ui
  #   ui_x, ui_y = coor
  #   program_x = board.grid.size - ui_x - 1
  #   program_y = ui_x
  #   [program_x, program_y]
  # end
  #


  # def Game.convert_coord_from_program_to_ui_perspective(coor)
  #   program_x, program_y = coor
  #   program_x = board.grid.size - ui_x - 1
  #   ui_x = board.grid.size - program_x - 1
  #   [ui_x, ui_y]
  # end

  def set_up_board
    piece_shape = " \u25C9 ".encode('utf-8')

    pieces_black = Array.new(12){Piece.new(player1.color, self, piece_shape)}
    pieces_red = Array.new(12){Piece.new(player2.color, self, piece_shape)}

    black_starting_positions = [
      [0,1,0,1,0,1,0,1],
      [1,0,1,0,1,0,1,0],
      [0,1,0,1,0,1,0,1]
    ]

    red_starting_positions = [
      [1,0,1,0,1,0,1,0],
      [0,1,0,1,0,1,0,1],
      [1,0,1,0,1,0,1,0]
    ]

    black_starting_positions.each_with_index do |row, r_idx|
      row.each_with_index do |piece_flag, c_idx|
        pos = r_idx, c_idx
        if piece_flag == 1
          board[pos] = pieces_black.pop
        else
          board[pos] = nil
        end
      end
    end

    red_starting_positions.each_with_index do |row, r_idx|
      row.each_with_index do |piece_flag, c_idx|
        pos = (r_idx + 5), c_idx
        if piece_flag == 1
          board[pos] = pieces_red.pop
        else
          board[pos] = nil
        end
      end
    end
  end


end
byebug
p1 = Player.new(:white)
p2 = Player.new(:red)
g = Game.new(p1, p2)
g.set_up_board
b = g.board
b.render
