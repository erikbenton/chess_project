require_relative './models/pawn.rb'
require_relative './models/rook.rb'
require_relative './models/knight.rb'
require_relative './models/bishop.rb'
require_relative './models/queen.rb'
require_relative './models/king.rb'
require_relative './models/chessboard.rb'
require_relative './models/player.rb'

rook = Rook.new([4,4], "black")
board = Chessboard.new

player1 = Player.new("white")
player2 = Player.new("black")

player1.pieces.each do |name, piece|
	board.add_piece(piece)
end

player2.pieces.each do |name, piece|
	board.add_piece(piece)
end

puts board.draw_board