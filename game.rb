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




end
