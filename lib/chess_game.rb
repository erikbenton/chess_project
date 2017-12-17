require_relative './models/pawn.rb'
require_relative './models/rook.rb'
require_relative './models/knight.rb'
require_relative './models/bishop.rb'
require_relative './models/queen.rb'
require_relative './models/king.rb'

rook = Rook.new([4,4], "black")

puts rook.possible_moves.inspect