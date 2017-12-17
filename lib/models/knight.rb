require_relative 'piece.rb'

class Knight < Piece
	attr_accessor :position

	def initialize(position, color)
		@position = position
		@color = color
		@position_changes = [[1,2], [-1,-2], [-1,2], [1,-2], [2,1], [-2,-1], [-2,1], [2,-1]]
		@possible_moves = self.calc_moves
		@icon = "k"
	end

end