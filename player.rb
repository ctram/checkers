require 'piece'

# player
class Player
  attr_accessor :pieces_in_play
  attr_reader :color

  def initialize(color)
    self.color = color
    self.pieces_in_play = Array.new(12) {Piece.new(color)}
  end
end
