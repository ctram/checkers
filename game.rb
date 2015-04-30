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
    pieces_black = Array.new(12){Piece.new(player1.color, self, "pb")}
    pieces_red = Array.new(12){Piece.new(player2.color, self, "pr")}

    # setup black pieces
    offset = true
    byebug
    3.times do |row|
      8.times do |col|
        col += 1 if offset
        pos = [row, col]
        if col.even?
          board[pos] = nil
          next
        end
        piece = pieces_black.pop
        piece.pos = pos
        board[pos] = piece
      end
      offset = !offset
    end

    board.number_pieces_on_board
    byebug

    # setup red pieces
    offset = false
    3.times do |row|
      row = row + 5
      8.times do |col|
        col += 1 if offset
        pos = [row, col]
        if col.even?
          board[pos] = nil
          next
        end
        piece = pieces_red.pop
        piece.pos = pos
        board[pos] = piece
      end
      offset = !offset
    end
  end


end
p1 = Player.new(:black)
p2 = Player.new(:white)
g = Game.new(p1, p2)
g.set_up_board
b = g.board
b.render
