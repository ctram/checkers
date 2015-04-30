require_relative 'piece'

# player
class Player
  attr_accessor :pieces_in_play, :color

  def initialize(color)
    self.color = color
  end
end
