# game for checkers

=begin
  classes
    Game
    Board
    Piece
    Plauer



  Classes
    Game
      attr:
        @board
        @current_player
      methods:
        #play
        #player_turn
        #win?
        #over?
    Board
      attr:
        @grid
      methods:
        #render
        #check_for_win  -> player has no more pieces left
    Piece
      attr
        @color
        @board
      methods:
        #move(pos)
        #check_that_an_enemy_was_killed
        #remove_from_board
    Player
      attr
        @color
        @pieces
      methods:
        #pick_piece_to_move
        #pick_destination

  Game Logic
    start game
    until there is a game over condition
      render_board
      current_player takes turn
      toggle player
      



=end
