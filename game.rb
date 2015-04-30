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

  end

  def player_turn
  end

  def win?

  end

  def over?

  end

  def can_player_kill_an_enemy?
    # To be used later to check whether the player can move again
    If he has killed an enemy, then he should possibily be able to move again (i.e. he can chain attacks)
  end

  def convert_coord_for_ui_perspective(coor)
    # program_x + grid.size - (program_x + (program_x + 1))
    # (grid.size - 1 - program_x) <= to get from program_x to x_ui
    ui_x, ui_y = coor
    program_x = board.grid.size - ui_x - 1
    program_y = ui_x
    [program_x, program_y]
  end




end
