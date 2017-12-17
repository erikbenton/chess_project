require_relative './models/pawn.rb'
require_relative './models/rook.rb'
require_relative './models/knight.rb'
require_relative './models/bishop.rb'
require_relative './models/queen.rb'
require_relative './models/king.rb'
require_relative './models/chessboard.rb'

rook = Rook.new([4,4], "black")
board = Chessboard.new

puts rook.possible_moves.inspect

puts board.draw_board