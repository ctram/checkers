require_relative 'piece'

# player
class Player
  attr_accessor :pieces_in_play, :color, :board

  def initialize(color)
    self.color = color
  end

  def takes_turn
    puts "Enter which piece you want to move:"
  end

  def choose_piece
    puts 'Enter the coordinate of the piece you want to move.'
    pos = gets.chomp.split('')
    pos.map! {|e| e.to_i}
  end

  def choose_destination
    puts 'Enter the coordinate of the square you want to land on.'
    pos = gets.chomp.split('')
    pos.map! {|e| e.to_i}
  end

  def chosen_piece_is_same_team?(pos)
    piece = board.piece_at(pos)
    if piece.color == color
      true
    else
      false
    end
  end

end
